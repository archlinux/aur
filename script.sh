#!/bin/bash


userInput='';

if [[ -z $1 ]];then
	read -p "Please Enter the word that you're looking for : " userInput
else 
	userInput=$1
fi

firstLetter=$(echo $userInput | cut -c 1 | tr a-z A-Z)
file="/etc/farsidic/dictionaries/${firstLetter}.json";

word=$(jq ".Words[] | select(.EnglishWord == \"${userInput}\")" $file)
isWordExisted=$(echo $word | jq 'length')



if [[ $isWordExisted -eq 0 ]];then
	echo 'The word' $userInput 'not found'
	exit
fi;


length=$( echo $word | jq '.Meanings | length')



result=$(echo $word | jq '.Meanings')


for i in $(seq 0 $(($length - 1)) );do
	echo $result | jq ".[${i}]"
done
