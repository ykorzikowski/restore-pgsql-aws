#!/bin/sh
S3_FILENAME="$S3/$FILENAME"

if [ $? -ne 1 ]; then
    aws s3 cp "$S3_FILENAME" /pg_backup
    pg_restore /pg_backup/$FILENAME
    rm /pg_backup/*
    exit 0
fi

exit 1
