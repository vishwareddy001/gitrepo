#!/bin/bash

sudo wget https://s3-ap-southeast-1.amazonaws.com/blackbuck-download-test/dberrors.log
sudo cat dberrors.log > temp.csv
sudo rm -rf dberrors.log

#This is to get set variable DATE in required YYYY-MM-DD format
DATE=`date +%Y-%m-%d`

a=`grep -c "$DATE" temp.csv`

echo "$DATE,$a" > vishwanathdaily.csv

#If this script has to run on daily basis we can set a cron job at a particular time
s3cmd put vishwas.csv https://s3-ap-southeast-1.amazonaws.com/blackbuck-download-test/

sudo rm -rf temp.csv vishwanathdaily.csv

