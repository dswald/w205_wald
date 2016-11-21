from __future__ import absolute_import, print_function, unicode_literals

import sys
import psycopg2

num_args = len(sys.argv)

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()
cur.execute("SELECT word, count from Tweetwordcount")
records = cur.fetchall()
records.sort()

if num_args == 1:
    for rec in records:
        print(rec[0] + ":", rec[1])

if num_args ==2:
    for rec in records:
        if rec[1] >= sys.argv[1]:
            print(rec[0] + ":", rec[1])

else:
    for rec in records:
        if rec[1] >= sys.argv[1] and rec[1] <= sys.argv[2]:
            print(rec[0] + ":", rec[1])


conn.commit()
conn.close()
