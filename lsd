#!/bin/bash

#Global Variables
rows=20;
width=100;
widthOffset=0;

#	Initial clear
printf "\033c"

# Take the user parameters. 
while test $# -gt 0; do
	case "$1" in
		-r | --rows)
			shift
			rows=$1
			shift
			;;

		-w | --width)
			shift
			width=$1
			shift
			;;

		-o | --offset)
			shift
			widthOffset=$1
			shift
			;;

		*)
			echo "$1 is not a recognized flag!"
			exit 1;
			;;
	esac
  done  

# An infinite loop.
for((j=1; j<3;)); do
	for((row=0; row<rows;  row++)) do

		for((k=0; k<widthOffset; k++)); do
			printf " ";
		done

		i=$((16 + RANDOM/256))
		for((k=0; k<width; k++)); do
			
			printf "\e[48;5;${i}m " $i;
			printf '\e[0m';
			[ ! $((($i - 15) % 6)) -eq 0 ] && printf '';
		done

		printf '\n';
	done

	sleep .001;

	# clear screen || reset the curser to the first location
	# for((row=0; row<rows; row++)) do
	# 	printf '\e[A\e[K'
	# done
	printf "\033c"

done
