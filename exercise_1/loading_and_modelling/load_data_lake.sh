#!/bin/bash
dir=$(pwd)

mkdir ~/staging
mkdir ~/staging/exercise_1

cd ~/staging/exercise_1

dataURL="https://data.medicare.gov/views/bg9k-emty/files/0a9879e0-3312-4719-a1db-39fd114890f1?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget "$dataURL" -O medData.zip
unzip medData.zip

file1="Hospital General Information.csv"
new1="hospitals.csv"
tail -n +2 "$file1" >$new1

file2="Timely and Effective Care - Hospital.csv"
new2="effective_care.csv"
tail -n +2 "$file2" >$new2

file3="Readmissions and Deaths - Hospital.csv"
new3="readmissions.csv"
tail -n +2 "$file3" >$new3

file4="Measure Dates.csv"
new4="measures.csv"
tail -n +2 "$file4" >$new4

#no spaces in this one
file5="hvbp_hcahps_11_10_2016.csv"
new5="surveys_responses.csv"
tail -n +2 $file5 >$new5

hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -put $new1 /user/w205/hospital_compare
hdfs dfs -put $new2 /user/w205/hospital_compare
hdfs dfs -put $new3 /user/w205/hospital_compare
hdfs dfs -put $new4 /user/w205/hospital_compare
hdfs dfs -put $new5 /user/w205/hospital_compare

cd $dir

exit
