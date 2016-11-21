from __future__ import absolute_import, print_function, unicode_literals

import sys
# from collections import Counter
# from streamparse.bolt import Bolt
# import psycopg2

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

num_args = len(sys.argv)

cur = conn.cursor()
cur.execute("SELECT word, count from Tweetwordcount")
records = cur.fetchall()

for rec in records:
   print "word = ", rec[0]
   print "count = ", rec[1], "\n"
conn.commit()

# for arg in sys.argv:
#     print ("word = ", arg)
#     for arg in records:
#        print "word = ", arg[0]
#        print "count = ", arg[1], "\n"
#     conn.commit()

conn.close()
#
#
# class WordCounter(Bolt):
#
#     def initialize(self, conf, ctx):
#         self.counts = Counter()
#
#         conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
#
#
#
# #pull results from postgress
# import psycopg2
#
# conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
#
# #Create a Table
# #The first step is to create a cursor.
#
# cur = conn.cursor()
#
# #Select
# cur.execute("SELECT word, count from Tweetwordcount")
# records = cur.fetchall()
# for rec in records:
#    print "word = ", rec[0]
#    print "count = ", rec[1], "\n"
# conn.commit()
#
# conn.close()
