#!/usr/bin/env bash

kernel=$(uname -r)>/dev/null
username=$(uname -n)>/dev/null
os=$(uname -o)>/dev/null
machine=$(uname -m)>/dev/null

### Variables (1 or 0) ###
showos=1
showm=1
showname=1
showkernel=1
showcolours=1
###                   ###

if [ "$showos" == "1" ]; then
				echo "Operating System: $os"
fi

if [ "$showm" == "1" ]; then
				echo "Machine: $machine"
fi

if [ "$showname" == "1" ]; then
				echo "Username: $username"
fi

if [ "$showkernel" == "1" ]; then
				echo "Kernel: $kernel"
fi

if [ "$showcolours" == "1" ]; then
				printf "\n"
				printf "\033[33mYellow \033[0m"
				printf "\033[32mGreen \033[0m"
				printf "\033[31mRed \033[0m"
				printf "\033[30mBlack \033[0m"
				printf "\033[34mBlue \033[0m"
				printf "\033[35mPurple \033[0m"
				printf "\033[36mCyan \033[0m"
				printf "\033[37mWhite \033[0m"
				printf "\n"
fi

if [ -f ~/.config/rfetch/config ]; then
				source ~/.config/rfetch/config
fi

if [ -f ~/.config/rfetchrc ]; then
				source ~/.config/rfetchrc
fi
