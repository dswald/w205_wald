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
        # cur = conn.cursor()
        # cur.execute('''DROP TABLE Tweetwordcount;''')
        # conn.commit()
        # cur.execute('''CREATE TABLE Tweetwordcount
        #        (word TEXT     NOT NULL,
        #        count INT     NOT NULL);''')
        # conn.commit()
        # conn.close()


    def process(self, tup):
        import psycopg2

        word = tup.values[0]

        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        cur = conn.cursor()

        self.counts[word] += 1
        self.emit([word, self.counts[word]])
        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))

        if self.counts[word] == 1:
            cur.execute("INSERT INTO tweetwordcount (word,count) \
                        VALUES (%s, %s)", (word, self.counts[word]));
            # conn.commit()
        elif self.counts[word] > 1:
            cur.execute("UPDATE tweetwordcount SET count=%s WHERE word=%s", (self.counts[word], word))
            # conn.commit()
        else:
            print "if statement failure"
        conn.commit()
        conn.close()
