import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

conn = psycopg2.connect(database ="tcount", user ="postgres", password ="pass", host = "localhost", port ="5432")
cur = conn.cursor()

#Make sure to coerce to lower to avoid capitalization problems
if len(sys.argv)== 2:
        word = sys.argv[1].lower()
        cur.execute("SELECT word, count from tweetwordcount where lower(word)=%s", (word,))
        values = cur.fetchall()

        if len(values) == 0:
                print 'The word did not appear'
        else:
                print "Total number of occurences of ",values[0][0]," are",values[0][1]

        conn.close()
        exit(1)

elif len(sys.argv)==1:
        cur.execute("SELECT lower(word) as word, count from tweetwordcount")
        values = cur.fetchall()
        for x in values:
                print x[0], ",", x[1]
        conn.close()
        exit(1)

else:
        print 'Sorry, only 1 or fewer arguments allowed.'
