#!/bin/bash -x

echo "Welcome to FlipCoin Combination"
declare -A doubl
flipCoin=1

function checkCoin ()
{
	case $1$2 in
	00) doubl[hh]=$(( ${doubl[hh]} + 1 )) ;;
	01) doubl[ht]=$(( ${doubl[ht]} + 1 )) ;;
	10) doubl[th]=$(( ${doubl[th]} + 1 )) ;;
	11) doubl[tt]=$(( ${doubl[tt]} + 1 )) ;;
	*) echo "error" ;;
	esac
}
while [ $flipCoin -le 20 ]
do
	random1=$(( RANDOM % 2 ))
	random2=$(( RANDOM % 2 ))
	checkCoin $random1 $random2
	flipCoin=$(( $flipCoin + 1 ))
done

for key in ${!doubl[@]}
do
	statement=`echo | awk -v key="$key" -v value="${doubl[$key]}" '{ percent = (value / 20) * 100 } END { print key " is " percent "%" }'`
	echo "$statement"

done
