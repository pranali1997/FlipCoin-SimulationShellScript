#!/bin/bash -x

echo "WELCOME TO FLIP COIN SIMULATION"

read -p "enter the number of times you want to flip the coin" flip

head=0
tail=0
declare -A combinationDict

for((i=1;i<=flip;i++))
do
	randomFlip=$((RANDOM%2))
	if [ $randomFlip -eq 1 ]
	then
		head=$(($head+1))
		combinationDict[$i]=Head
	else
		tail=$(($tail+1))
		combinationDict[$i]=Tail
	fi
done
total=$(($head+$tail))
headPer=$((100*$head/$total))
tailPer=$((100*$tail/$total))
echo "head percentage :"$headPer
echo "tail percentage :"$tailPer
