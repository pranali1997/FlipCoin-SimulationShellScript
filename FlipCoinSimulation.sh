#!/bin/bash -x

echo "WELCOME TO FLIP COIN SIMULATION"

randomFlip=$((RANDOM%2))

if [ $randomFlip -eq 1 ]
then
	echo "Head"
else
	echo "tail"
fi
