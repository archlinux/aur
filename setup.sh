#!/bin/bash

# Переменные
t="$1"
p="$2"
n1="$3"
n2="$4"
papop="$5"
error="For a hint use command - app setup help"

# Установка -с
create() {
	# Переменные функции
	local pfile=""
	local fname="$2"
	local com="$3"
	local endecho=""
	# Проверка типа
	case $1 in
		app)
			pfile="$HOME/.app-opener/apps/"
			fname="$2"
			endecho="\e[32mapp $fname created...\e[0m"
			;;
		scr)
			pfile="$HOME/.app-opener/scripts/"
			fname="$2"
			endecho="\e[32mScript $fname created...\e[0m"	
			;;
	esac
	# Проверка на копию
	if [ -f $pfile$fname ]; then
		read -p "File $fname already exists. Overwrite? (y/n): " cmf
		if [ "$cmf" != "y" ]; then
			case $1 in
				app)
					endecho="\e[31mThe app not created...\e[0m"
					;;
				scr)
					endecho="\e[31mThe script not created...\e[0m"
					;;
			esac
		echo -e $endecho
		exit 0
		fi
	fi
	# Установка текста в файлы
	echo "#!/bin/bash" > $pfile$fname
	if [ $1 == "app" ]; then
		echo "" >> $pfile$fname
		echo "# Это приложение создано app-opener :)" >> $pfile$fname
		echo "" >> $pfile$fname
		echo "echo -e '\e[32mStarting ${fname^}...\e[0m'" >> $pfile$fname
		if [[ -z $com ]]; then
			echo "# [app-opener] > Привет, $fname, почему ты пустой?" >> $pfile$fname
			echo "# [$fname] > Потому что ты меня таким создал..." >> $pfile$fname
			echo "# [app-opener] > Это не моя вина, я сделал то что просил $USER, прости меня..." >> $pfile$fname
			echo "# [$fname] > Надеюсь я не буду всю жизнь пустым и ненужным..." >> $pfile$fname
			echo "# [app-opener] > Не переживай, я надеюсь $USER тебя когда то заполнит и ты будешь таким же как я..." >> $pfile$fname
		else
			echo "$com" >> $pfile$fname
		fi
		chmod +x $pfile$fname
	else
		echo "" >> $pfile$fname
		echo "# Это пустой скриптовый файл созданный app-opener :)" >> $pfile$fname
		chmod +x $pfile$fname
	fi
	echo -e $endecho
}

case $t in
	app)
		case $p in
			-c)
				create app "$n1" "$n2"
				;;
			*)
				cp $p $papop"/apps/"$n1
				chmod +x $papop"/apps/"$n1
				echo "File $n1 was embedded as a app..."
				;;
		esac
		;;
	scr)
		case $p in
			-c)
				create scr "$n1"
				;;
			*)
				cp $p $papop"/scripts/"$n1
				chmod +x $papop"/scripts/"$n1
				echo "File $n1 was embedded as a script..."
				;;
		esac
		;;
	help)
		echo "$4"
		echo -e "\e[32msetup - needed for the setup apps and scripts.\e[0m"
		echo "---------------------------------------------------"
		echo "app  - setup apps (open)."
		echo "|	-с - setup with create file."
		echo '|	app setup app -c <name> "<command>"'
		echo "|	app setup app </path/to/original> <name>"
		echo "scr  - setup scripts (start)."
		echo "|	-с - setup with create app."
		echo "|	app setup scr -с <name>"
		echo "|	app setup scr </path/to/original> <name>"
		echo "help - show this is menu."
		;;
	*)
		echo $error
		;;
esac
