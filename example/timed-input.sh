#!/bin/bash

TIMELIMIT=3

PrintAnswer()
{
	if [ "$answer" = TIMEOUT ]
	then
		echo $answer
	else
		echo "Your favorite veggie is $answer"
		kill $!
	fi
}

TimeOn()
{
	sleep $TIMELIMIT && kill -s 14 $$ &
}

Int14Vector()
{
	answer="TIMEOUT"
	PrintAnswer
	exit 14
}

trap Int14Vector 14
echo "What is your favorite vegetable"
TimeOn
read answer
PrintAnswer

exit 0
