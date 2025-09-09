#!/bin/sh

if [ $# -ne 2 ]; then
    echo "Insufficient number of arguments"
    exit 1
fi

WRITEFILE=$1
WRITESTR=$2

echo "$WRITESTR" > $WRITEFILE

echo_rc=$?
if [ $echo_rc -ne 0 ]; then
    echo "File write failed"
    exit 1
fi
