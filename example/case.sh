#!/bin/bash

clear
echo "          Contact List"
echo "          ------------"
echo "Choose one of the following persons:"
echo
echo "[E]vans,Roland"
echo "[J]ones,Mildred"
echo "[S]mith,Julie"
echo "[Z]ane,Morris"
echo

read person

case "$person" in
"E" | "e")
echo
echo "Roland Evans"
;;
"J" | "j" )
echo
echo "Mildred Jones"
;;
*)
echo
echo "Not yet in database"
;;
esac

echo

exit 0
