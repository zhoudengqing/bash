#!/bin/bash

E_NOARGS=0
E_ARGSERROR=66
E_WRONG_FILE_TYPE=67

if [ $# -eq "$E_NOARGS" ]
then
	echo "Usage: `basename $0` C-program-file" >&2
	exit $E_ARGSERROR
fi

type=`file $1 | awk '{print $2, $3, $4, $5}'`
#echo $type
correct_type="C source, ASCII text"
#echo $correct_type

if [ "$type" != "$correct_type" ]
then
	echo
	echo "This script works on C program files only"
	echo
	exit $E_WRONG_FILE_TYPE
fi

sed '/^\/\*/d;/.*\*\//d' $1

exit 0













