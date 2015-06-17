#!/bin/bash

MAX_CLIENTS=10
IS_SCREENSAVER_DISABLED="true"

function usage {
	echo -e "USAGE: start_vpd.sh [options]\n"
	echo -e "Standard options:"
	echo -e "\t-max_clents or -mc\tVALUE\n\t\tmaximum number of users simultaneously connected [default $MAX_CLIENTS]"
	echo -e "\t-ss_disabled or -ssd\n\t\tdisable the ScreenSaver [default]"
	echo -e "\t-ss_enabled or -ssd\n\t\tenable (if it's active) the ScreenSaver"	
	echo -e "\t-help or -h\n\t\tdisplay this help and exit"
}


while [ x"$1" != x ] ; do
	case "$1" in
    	-max_clientsi|-mc)
		MAX_CLIENTS=$2
		shift
		;;
	-ss_disabled|-ssd)
		IS_SCREENSAVER_DISABLED="true"
		;;
	-ss_enabled|-sse)
		IS_SCREENSAVER_DISABLED="false"
		;;
	-h|--help|-help)
		usage
		exit 0
		;;
	*)
		echo "WRONG parameters"
		usage
		exit 1
		;;
	esac
	shift
done



java -jar /opt/vpointer-desktop/vPointerDesktop.jar $MAX_CLIENTS $IS_SCREENSAVER_DISABLED

