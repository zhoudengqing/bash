#!/bin/bash

a=24
b=47
if [ "$a" -eq 24 ] && [ "$b" -eq 47 ]
then
	echo "Test #1 success."
else
	echo "Testtt #1 fails."
fi

if [ "$a" -eq 98 ] || [ "$b" -eq 47 ]
then
	echo "Test #2 success."
else
	echo "Test #2 fails."
fi

if [ "$a" -eq 24 -a "$b" -eq 47 ]
then
	echo "Test #3 success."
else
	echo "Testtt #3 fails."
fi

if [ "$a" -eq 98 -o "$b" -eq 47 ]
then
	echo "Test #4 success."
else
	echo "Testtt #4 fails."
fi

a=rhino
b=crocodile
if [ "$a" = rhino ] && [ "$b" = crocodile ]
then 
	echo "Test #5 success."
else
	echo "Test #5 fails."
fi

exit 0