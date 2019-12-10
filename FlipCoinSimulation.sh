#!/bin/bash -x
u
echo "WELCOME TO FLIP COIN SIMULATION"

read -p "enter the number of times you want to flip the coin" flip

head=0
tail=0
counter=0
declare -A combinationDict
declare -A singletDict
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
	headPer=$((100*$head/$total))
	tailPer=$((100*$tail/$total))
	echo ${combinationDict[@]}

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
			H=$(($head+1))
		else
			T=$(($tail+1))
		fi
	done

	echo H=$((100*$head/$flip))
	echo T=$((100*$tail/$flip))
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
	echo HH=$((100*HH/$flip))
	echo TT=$((100*TT/$flip))
	echo HT=$((100*HT/$flip))
	echo TH=$((100*TH/$flip))
}
