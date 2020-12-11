#!/bin/bash -x

echo "Welcome to FlipCoin Combination"
declare -A triplet
flipCoin=1

function checkCoin ()
{
	case $1$2$3 in
		000) triplet[hhh]=$(( ${triplet[hhh]} + 1 )) ;;
		001) triplet[hht]=$(( ${triplet[hht]} + 1 )) ;;
		010) triplet[hth]=$(( ${triplet[hth]} + 1 )) ;;
		100) triplet[thh]=$(( ${triplet[thh]} + 1 )) ;;
		110) triplet[tth]=$(( ${triplet[tth]} + 1 )) ;;
		011) triplet[htt]=$(( ${triplet[htt]} + 1 )) ;;
		101) triplet[tht]=$(( ${triplet[tht]} + 1 )) ;;
		111) triplet[ttt]=$(( ${triplet[ttt]} + 1 )) ;; 
	*) echo "error" ;;
	 esac
}

while [ $flipCoin -le 50 ]
do
	random1=$(( RANDOM % 2 ))
	random2=$(( RANDOM % 2 ))
	random3=$(( RANDOM % 2 ))
	checkCoin $random1 $random2 $random3
	flipCoin=$(( $flipCoin + 1 ))
done

for key in ${!triplet[@]}
do
	statement=`echo | awk -v key="$key" -v value="${triplet[$key]}" '{ percent = (value / 50) * 100 } END { print key " is " percent "%" }'`
	echo "$statement"

done
