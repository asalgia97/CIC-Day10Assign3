#!/bin/bash -x
echo "Welcome to FlipCoin Combination"
flipCoin=y

function checkCoin ()
{
	if [ $1 -eq 0 ]
	then
		echo "Heads"
	else
		echo "Tails"
	fi
}

while [ $flipCoin == y ]
do
	random=$(( RANDOM % 2 ))
	checkCoin $random
read -p "do you want to flip the coin again? (y/n): " flipCoin
done
