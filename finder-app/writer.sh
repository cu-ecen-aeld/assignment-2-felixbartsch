#!/bin/sh

if [ $# -ne 2 ]; then
    echo "Insufficient number of arguments"
    exit 1
fi

WRITEFILE=$1
WRITESTR=$2

echo "$WRITESTR" > $WRITEFILE
