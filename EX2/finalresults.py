from __future__ import absolute_import, print_function, unicode_literals

import sys
import psycopg2

num_args = len(sys.argv)

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()
cur.execute("SELECT word, count from Tweetwordcount")
records = cur.fetchall()

if num_args > 1:
    for rec in records:
        if rec[0] in sys.argv:
            print("Total number of occurences of \""+rec[0]+"\":", rec[1])

elif num_args == 1:
    records.sort()
    print(records)

else:
    print("invalid entry: type word or words to find twitter analytics")

conn.commit()
conn.close()
