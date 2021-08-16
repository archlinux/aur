#!/bin/bash

#######################################
#      Creator : BL4CKH47H4CK3R       #
#  https://github.com/BL4CKH47H4CK3R  #
#######################################

echo -e "-------------------------"
echo -e "| Auto-CPU-Optimization |"
echo -e "-------------------------"
echo -e "[1] Enable CPU Optimization"
echo -e "[2] Disable CPU Optimization"

read -p "[*] Enter Choice [1, 2]: " INPUT

if [[ ${INPUT} == 1 ]]
then
	CPU=`gcc -Q -march=native --help=target | grep march | awk '{print $2}' | head -1`
	MARCH=`echo "${CPU}" | tr '[:lower:]' '[:upper:]'`

	if [[ ${MARCH} == "ZNVER" ]]
	then
		MARCH="ZEN"

	elif [[ ${MARCH} == "ZNVER2" ]]
		then
		MARCH="ZEN2"

	elif [[ ${MARCH} == "ZNVER3" ]]
	then
		MARCH="ZEN3"
	fi

	echo -e "[*] Detected CPU : `echo ${MARCH}`"
	echo -e "[*] Setting Detected CPU Microarchitecture ..."
	sed -i '/CONFIG_GENERIC_CPU=y/d' .config
	sed -i "s/\# CONFIG_M${MARCH} is not set/CONFIG_M${MARCH}=y/g" .config
fi
