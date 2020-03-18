#!/bin/bash

MINLEN=45

while read line
do
	echo "$line"
	len=${#line}
	if [ "$len" -lt "$MINLEN" ]
	then echo
	fi
done

exit 0
