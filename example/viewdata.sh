#!/bin/bash

DATAFILE=test.log
ARGNO=1

if [ $# -lt "$ARGNO" ]
then
	less $DATAFILE
else
	grep "$1" $DATAFILE
fi

exit 0
