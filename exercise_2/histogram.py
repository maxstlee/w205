import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT


if len(sys.argv) != 3:
        print 'Sorry, must pass only two arguments.'

elif sys.argv[1] >= sys.argv[2]:
        print 'Sorry, those do not appear to be in the correct order'

else:
        conn = psycopg2.connect(database ="tcount", user ="postgres", password ="pass", host = "localhost", port ="5432")
        cur = conn.cursor()

        a = sys.argv[1]
        b = sys.argv[2]

        cur.execute("SELECT word, count from tweetwordcount WHERE count between %s and %s", (a,b,))
        x = cur.fetchall()

        if len(x) == 0:
                print 'No records matched the parameters'
        else:
                for y in x:
                        print y[0], ':', y[1]

        conn.close()
        exit(1)
