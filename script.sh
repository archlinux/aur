#!/bin/bash

file='/etc/farsidic/index.json'
word='';

if [[ -z $1 ]];then
	read -p "Please Enter the word that you're looking for : " word
else 
	word=$1
fi

length=$(jq '.'$word $file | jq 'length')

if [[ $length -eq 0 ]];then
	echo 'The word' $word 'not found'
	exit
fi;


result=$(jq '.'$word $file)


for i in $(seq 0 $(($length - 1)) );do
	echo $result | jq ".[${i}]"
done
