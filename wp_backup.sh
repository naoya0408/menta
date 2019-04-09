#/bin/bash

DIR=/root/backup

DATE=`date +%Y%m%d`
OLD_DATE=`date +%Y%m%d --date "5 days ago"`

DUMP=$DIR/mysqldump.$DATE.sql
OLD_DUMP=$DIR/mysqldump.$OLD_DATE.sql

mysqldump -u root -pSakasitasakasu3859! --all-databases > $DUMP

rm -f $OLD_DUMP
