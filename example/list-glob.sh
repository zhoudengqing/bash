#!/bin/bash

echo
for file in *
do
	ls -l "$file"
done

echo;echo

for file in [jx]*
do
	ls -l $file
	echo "Removed file \"$file\""
done

exit 0
