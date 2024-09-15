#!/bin/sh

archives=archives
if test -d marconi100
then
    echo "marconi100 already exists"
    exit 1
fi
mkdir marconi100

input=`echo $archives/*/*.0`
timestamp=`echo $input | sed -e 's,.*/,,'g -e 's/.0$//g'`
output=marconi100/$timestamp

echo pmlogextract $input $output
time pmlogextract $input $output
