#!/bin/bash

args=(${@})
comand=${args[0]}
packages=${args[@]:1}

case $comand in
	install)
		pacman -Syu ${packages[@]}
	;;
	remove)
		pacman -R ${packages[@]}
	;;
	stand)
		pacman -R cant
	;;
	*|help)
		echo "The Canterbury Distribution Package Manager"
		echo ''
		echo "usage: cant [option] <packages>"
		echo 'options:'
		echo '	install		install packages'
		echo '	remove		remove packages'
		echo '	stand		remove the Canterbury Distribution Package Manager'
		echo '	help		this text'
		echo ''
	;;
esac
