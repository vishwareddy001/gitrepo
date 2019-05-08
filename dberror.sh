#!/bin/bash
#set -x
sudo rm -rf vishwanath.csv
sudo wget https://s3-ap-southeast-1.amazonaws.com/blackbuck-download-test/dberrors.log
sudo cat dberrors.log > vishwanath.csv
sudo rm -rf dberrors.log
#sort vishwanath.csv 
grep ^2018-05-07 vishwanath.csv > date
y=`cut -c-10 date`
a=`grep -c 2018-05-07 vishwanath.csv`
#echo "$y,$a"

grep ^2018-06-21 vishwanath.csv > date1
cut -c-10 date1 > date2
w=`uniq date2`
b=`grep -c 2018-06-21 vishwanath.csv`

#echo "$w,$b"

echo -e "$y,$a\n$w,$b"  > vishwas.csv
cat vishwas.csv
sudo rm -rf date date1 date2

s3cmd put vishwas.csv https://s3-ap-southeast-1.amazonaws.com/blackbuck-download-test/
sudo rm -rf vishwas.csv
