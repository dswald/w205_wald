import psycopg2

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")


cur = conn.cursor()
cur.execute('''DROP TABLE tweetwordcount;''')
conn.commit()
cur.execute('''CREATE TABLE Tweetwordcount
       (word TEXT     NOT NULL,
       count INT     NOT NULL);''')
conn.commit()
conn.close()