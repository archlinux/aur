#!/bin/bash
currentpath="$(pwd)"
available_py="$(find /usr/bin -type l -iname "python[0-9]" | cut -f4 -d '/')"
current_version="$(readlink /usr/bin/python)"

function show_help () {
	echo "archlinux-python <COMMAND>"
	echo ""
	echo "COMMAND:"
	echo "        status          List installed Python-Versions"
	echo "        show-links      Show current links"
	echo "        set <python*>   Set python-Version as default"
}

function show_current_status () {
	for i in $available_py; do
		if [ "$i" = "$current_version" ]
			then
				echo "  $i (default)"
		else
			echo "  $i"
		fi
	done
}

if [ -z "$1" ]
	then
		show_help
elif [ "$1" = "status" ] 
	then
		echo "Available Python-Versions:"
		show_current_status				

elif [ "$1" = "set" ] 
	then
		if [ -z "$2" ]
			then
				echo "please specify a pytnon-version you want to set. options are:"
				show_current_status
		else
			for i in $available_py; do
				if [ "$i" = "$2" ]
					then
						match=$i
				fi
			done
			if [ ! -z "$match" ]
				then
					echo "set $2 as default"
					cd /usr/bin/
					sudo rm python
					sudo ln -s ${match} python
					sudo rm python-config
					sudo ln -s ${match}-config python-config
					cd $currentpath
			else
					echo "$2 is not a valid Python-Version"
			fi
		fi
	elif [ "$1" = "show-links" ]
		then
			ls -l /usr/bin/python | cut -f10,11,12 -d ' '
			ls -l /usr/bin/python-config | cut -f10,11,12 -d ' '
fi
