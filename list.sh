#!/bin/bash

# Переменные
app=$1
p="$HOME/.app-opener/"

# Приложения
applist() {
	echo -e "\e[32mApps:\e[0m"
	for file in $(ls $p"apps"); do
		if [[ -d $p"apps/"$file ]]; then
			echo -e "- \e[34m$file\e[0m"
		elif [[ -x $p"apps/"$file ]] && [[ -f $p"apps/"$file ]]; then
			echo "- "$file
		else
			echo -e "- \e[31m$file\e[0m"
		fi
	done
}

# Скрипты
scrlist() {
	echo -e "\e[32mScripts:\e[0m"
	for file in $(ls $p"scripts"); do
		if [[ -d $p"scripts/"$file ]]; then
			echo -e "- \e[34m$file\e[0m"
		elif [[ -x $p"scripts/"$file ]] && [[ -f $p"scripts/"$file ]]; then
			echo "- "$file
		else
			echo -e "- \e[31m$file\e[0m"
		fi
	done
}

# Выполнение
case $app in
	# Приложения
	apps)
		[[ -d $p"apps" ]] || echo -e "\e[31mCatalog 'apps' not found...\e[0m"
		applist
		;;
	# Скрипты
	scripts)
		[[ -d $p"scripts" ]] || echo -e "\e[31mCatalog 'scripts' not found...\e[0m"
		scrlist
		;;
	# Общий лист
	"")
		[[ -d $p"apps" ]] || echo -e "\e[31mCatalog 'apps' not found...\e[0m"
		applist
		echo
		[[ -d $p"scripts" ]] || echo -e "\e[31mCatalog 'scripts' not found...\e[0m"
		scrlist
		;;
	# Помощь
	help)
		echo -e "\e[32mThis is command show list installed app and scripts.\e[0m"
		echo "----------------------------------------------------------"
		echo "apps    - show installed apps."
		echo "scripts - show installed scripts."
		echo "help    - show this is menu."
		;;
	# Ошибка
	*)
		echo -e "\e[31mInvalid two command...\e[0m"
		;;
esac
