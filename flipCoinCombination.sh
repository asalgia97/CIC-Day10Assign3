#!/bin/bash -x

echo "Welcome To flipCoin Combination"
declare -A singlet
flipCoin=1

function checkCoin ()
{
	case $1 in
	0) singlet[head]=$(( ${singlet[head]} + 1 )) ;;
	1) singlet[tail]=$(( ${singlet[tail]} + 1 )) ;;
	*) echo "error" ;;
	esac
}


while [ $flipCoin -le 20 ]
do
	random=$(( RANDOM % 2 ))
	checkCoin $random
	flipCoin=$(( $flipCoin + 1 ))
done

echo "for start"
for key in ${!singlet[@]}
do
	echo "$key : ${singlet[$key]}"
done
