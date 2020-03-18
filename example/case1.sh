#!/bin/bash

case "$1" in 
"")
echo "Usage: ${0##*/} <filename>"
exit $E_PARM
;;
-*)
FILENAME=./$1
;;
*)
FILENAME=$1
;;
esac

