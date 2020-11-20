#!/bin/bash
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET_KEY=$4
BUCKET_NAME=$5
DATE=$(date +%H-%M-%S)

mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/db-$DATE.sql 2> /dev/null
export AWS_ACCESS_KEY_ID=AKIAWEGDQCBF7OHAFFED
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY
aws s3 cp /tmp/db-$DATE.sql s3://$BUCKET_NAME
