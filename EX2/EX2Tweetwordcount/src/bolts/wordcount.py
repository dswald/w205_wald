from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

        #Create a Table
        #The first step is to create a cursor.


        #Drop table and create new instance for every execution.
        #I made a design decision to support streaming analytics and not a running total.
        cur = conn.cursor()
        cur.execute('''DROP TABLE Tweetwordcount''')
        conn.commit()
        cur.execute('''CREATE TABLE Tweetwordcount
               (word TEXT PRIMARY KEY     NOT NULL,
               count INT     NOT NULL);''')
        conn.commit()
        conn.close()


    def process(self, tup):
        word = tup.values[0]

        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        cur = conn.cursor()

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount
        # Table name: Tweetwordcount
        # you need to create both the database and the table in advance.

        #Select
        cur.execute("SELECT word, count from tweetwordcount")
        # records = cur.fetchall()
        # if rec in records:
        #    num_word = rec[1] + 1;
        #    #update the count
        #    cur.execute("UPDATE Tweetwordcount SET count=%s WHERE word=%s", (word, num_word))
        #    conn.commit()
        # else:
        self.counts[word] += 1
        count += 1
        # self.emit([word, self.counts[word]])
        cur.execute("INSERT INTO tweetwordcount (word,count) \
                    VALUES (word, 1)");
        conn.commit()

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
        conn.close()
