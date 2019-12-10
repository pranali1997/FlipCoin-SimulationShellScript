#!/bin/bash -x

echo "WELCOME TO FLIP COIN SIMULATION"

read -p "enter the number of times you want to flip the coin" flip

#varibles
head=0
tail=0
counter=0

declare -A combinationDict
declare -A resultDict

function getPercentage()
{
	for((j=0; j<$flip; j++))
	do
		unset coinValue
		for((i=0; i<$coin; i++))
		do
			random=$((RANDOM%2))
			if [ $random -eq 1 ]
			then
				coinValue="H$coinValue "
				head=$(($head+1))
			else
				coinValue="T$coinValue"
				tail=$(($tail+1))
			fi
		done
		value="${!combinationDict[@]}"
		combinationDict["$j"]=$coinValue
	done
	total=$flip
	echo ${combinationDict[@]} | sort -n
}

function singlet()
{
	H=0 T=0
	single=""
	coin=1
	singletValue=$(getPercentage $coin)

	for i in $singletValue
	do
		if [ $i == "H" ]
		then
			H=$(($H+1))
		else
			T=$(($T+1))
		fi
	done

	resultDict["H"]=$((100*$H/$flip))
	resultDict["T"]=$((100*$T/$flip))
	echo ${resultDict[@]} | sort -n
}


function doublet()
{
	HH=0 TH=0 HT=0 TT=0
	double=""
	coin=2
	doubleValue=$(getPercentage $coin)

	for i in $doubleValue
	do
		if [ $i == "HH" ]
		then
			HH=$(($HH+1))
		elif [ $i == "TT" ]
		then
			TT=$(($TT+1))
		elif [ $i == "HT" ]
		then
			HT=$(($HT+1))
		elif [ $i == "TH" ]
		then
			TH=$(($HT+1))
		fi
	done
	resultDict["HH"]=$((100*HH/$flip))
	resultDict["TT"]=$((100*TT/$flip))
	resultDict["HT"]=$((100*HT/$flip))
	resultDict["TH"]=$((100*TH/$flip))
	echo ${resultDict[@]} | sort -n
}


function triplet()
{
	HHH=0 THH=0 HTH=0 HHT=0 TTH=0 THT=0 HTT=0 TTT=0
	triple=""
	coin=3
	tripleValue=$(getPercentage $coin)

	for i in $tripleValue
	do
		if [ $i == "HHH" ]
		then
			HHH=$(($HHH+1))
		elif [ $i == "THH" ]
		then
			THH=$(($THH+1))
		elif [ $i == "HTH" ]
		then
			HTH=$(($HTH+1))
		elif [ $i == "HHT" ]
		then
			HHT=$(($HTT+1))
		elif [ $i == "TTH" ]
		then
			TTH=$(($TTH+1))
		elif [ $i = "THT" ]
		then
			THT=$(($THT+1))
		elif [ $i == "HTT" ]
		then
			HTT=$(($HTT+1))
		elif [ $i == "TTT" ]
		then
			TTT=$(($TTT+1))
		fi
	done
	resultDict["HHH"]=$((100*$HHH/$flip))
	resultDict["THH"]=$((100*$THH/$flip))
	resultDict["HTH"]=$((100*$HTH/$flip))
	resultDict["HHT"]=$((100*$HHT/$flip))
	resultDict["TTH"]=$((100*$TTH/$flip))
	resultDict["THT"]=$((100*$THT/$flip))
	resultDict["HTT"]=$((100*$HTT/$flip))
	resultDict["TTT"]=$((100*$TTT/$flip))
	echo ${resultDict[@]} | sort -n
}

function main()
{
	echo "1.singlet"
	echo "2.doublet"
	echo "3.triplet"
	read -p "Enter your choice " choice
	case $choice in
		1)echo result=$(singlet);;
		2)echo result=$(doublet);;
		3)echo result=$(triplet);;
	esac
}
main
