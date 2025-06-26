#!/bin/bash

t="$1"
app="$2"
p="$3"
rmapp="$HOME/.app-opener/apps/"$app
rmscr="$HOME/.app-opener/scripts/"$app

# Функция удаления
remv() {
	# $1 - это тип файла (rmapp/rmscr)
	local tfile="$1"
	local whormapp="" # это переменная для ответа на отмену удаления
	local whosucrmapp="" # это переменная для ответа на успешное удаление
	local whoapp="" # это переменная для метки файла в скрипте
	local filenotfound="" # это переменная для ответа на не нахождение файла
	case $tfile in
		$rmapp)
			whormapp="Removing $app canceled..."
			whosucrmapp="The app $app successfully removed..."
			whoapp="app"
			filenotfound="The app $app not found..."
			;;
		$rmscr)
			whormapp="Removing $app canceled..."
			whosucrmapp="The script $app successfully removed..."
			whoapp="script"
			filenotfound="The script $app not found..."
			;;
	esac
	if [[ -d $tfile ]]; then
		read -p "This is folder $app that accidentally ended up here, remove? (y/n): " dcmf
		if [ $dcmf != "y" ]; then
			echo -e "\e[31mRemoving the folder canceled, maybe you need her...\e[0m"
		else
			rm -rf $tfile
			echo "This is an unnecessary folder $app removed, well, that's right..."
		fi
	elif [[ -f $tfile ]]; then
		read -p "Delete exactly the $whoapp '$app'? (y/n): " cmf
		if [ $cmf != "y" ]; then
			echo -e "\e[31m$whormapp\e[0m"
			exit 0
		else
			rm $tfile
			echo -e "\e[32m$whosucrmapp\e[0m"
		fi
	else
		echo -e "\e[31m$filenotfound\e[0m"
	fi
}

# База
case $t in
	app)
		remv $rmapp
		;;
	scr)
		remv $rmscr
		;;
	help)
		echo -e "\e[32mThis is command is needed for easy removal of app and scripts\e[0m"
		echo "-------------------------------------------------------------"
		echo "app remove app <app name>    - remove app."
		echo "app remove scr <script name> - remove script."
		;;
esac
