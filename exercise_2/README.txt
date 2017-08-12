Exercise 2

This is REaDME file that detals some of the basic steps to running the Exercise 2 architexture.

Step 1:  Load w205 EX2 Full AMI on EC2 instance and mount volume from Lab 2-4.  Attach this volume with command 
         $mount -t ext4 /dev/xvdf /data.  Note disk location might vary.  Start postgres
         
Step 2:  Ensure tweepy installed, $pip install tweepy, as well as psycopg2, $pip install psycopg2==2.6.2

Step 3:  Switch users to w205, $su - w205

Step 4:  Clone https://github.com/maxstlee/w205.git and cd into /w205/exercise_2

Step 5:  We create a tcount table, but to be sure no old data in database, please drop $psql -U postgres -c "DROP DATABASE tcount"`

Step 5:  CD into extweetwordcount and use command, $sparse run .  When happy with duration of stream, ctrl+C to exit.

Step 6:  CD back to exercise 2 and run two scripts:  $python finalresults.py, $pthon finalresults.py <word>, $python histogram.py 15 20


