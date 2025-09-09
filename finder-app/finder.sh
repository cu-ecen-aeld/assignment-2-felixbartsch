#!/bin/sh

if [ $# -ne 2 ]; then
    echo "Insufficient number of arguments"
    exit 1
fi

FILESDIR=$1
SEARCHSTR=$2

if [ ! -d $FILESDIR ]; then
    echo "$FILESDIR is not a directory"
    exit 1
fi

FILECOUNT=$(find $FILESDIR -type f | wc -l)
LINECOUNT=$(grep -r $SEARCHSTR $FILESDIR| wc -l)
echo "The number of files are $FILECOUNT and the number of matching lines are $LINECOUNT"
