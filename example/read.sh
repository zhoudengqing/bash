#!/bin/bash

tail -f test.log | while read LINE
do
	echo $LINE
done 
