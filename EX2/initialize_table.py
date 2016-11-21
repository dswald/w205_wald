cur = conn.cursor()
cur.execute('''DROP TABLE Tweetwordcount;''')
conn.commit()
cur.execute('''CREATE TABLE Tweetwordcount
       (word TEXT     NOT NULL,
       count INT     NOT NULL);''')
conn.commit()
conn.close()
