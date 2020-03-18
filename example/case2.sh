#!/bin/bash

while [ $# -gt 0 ]
do
case "$1" in
-d|--debug)
DEBUG=1
;;
-c|--conf)
CONFIG="$2"
shift
if [ ! -f $CONFIG ];then
	echo "Error:supplied file doesnot exist"
	exit $E_CONFFILE
fi
esac
shift
done

