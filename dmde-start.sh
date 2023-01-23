#!/bin/bash
szPassword=""
user_input=$(zenity --entry "Root PASS" --title "Input passwords" --text "Please, input the root passwords!" --entry-text "" --hide-text --width 300 --height 100)
if [ $? = 0 ]; then
	printf "%s\n" "${user_input}" | sudo --stdin /usr/share/dmde-linux/dmde
fi
rm -rf ${ANSWER}
clear
exit 0
