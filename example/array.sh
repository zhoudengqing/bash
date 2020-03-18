#!/bin/bash

Array=(element-zero element-one element-two element-three)

echo ${Array[0]}

echo ${!Array[@]}

for i in ${!Array[@]}
do
	echo ${Array[i]}
done
