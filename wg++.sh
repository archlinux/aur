#!/bin/bash

#/**
# * @file wg++
# * @brief just start WebGrab+Plus
# * @author WebGrab+Plus Community
# * @date 31/07/2016
# * @dotnet version
# * @date 13/03/2022
# */

CONFIG_DIR=~/wg++
EXECUTABLE=$(basename $0)

print_help () {
	echo -e "Usage:"
	echo -e "\t$EXECUTABLE - Uses default '$CONFIG_DIR' configuration directory. Will be created if missing."
	echo -e "\t$EXECUTABLE <path> - Path to configuration directory."
	echo -e "\t$EXECUTABLE --help - Show help screen."
	echo -e "\t"
	echo -e "Configuration template is stored in '/usr/share/wg++'. Copy it to your preferred location:"
	echo -e "\tcp -R /usr/share/wg++ /path/to/<configuration_directory>"
}

# Check if user supplied any arguments
if [ $# -eq 0 ]; then
	#### User did not provide any arguments to wg++ ####

	# Use default config dir "$CONFIG_DIR"
	if [ ! -d "$CONFIG_DIR" ]; then
		cp -R /usr/share/wg++ "$CONFIG_DIR"
		if [ -d "$CONFIG_DIR" ]; then
			echo "Configuration folder '$CONFIG_DIR' created! Run '$EXECUTABLE' again to use it."
			echo "For more information, see '$EXECUTABLE --help'."
			exit 0
		else
			echo "Failed to create configuration folder '$CONFIG_DIR'!"
			print_help
			exit 1
		fi
	fi

	# Check if "$CONFIG_DIR" contains configuration file
	if [ ! -f "$CONFIG_DIR/WebGrab++.config.xml" ]; then
		echo "Some configuration files are missing from '$CONFIG_DIR' directory!"
		print_help
		exit 1
	fi

	# Double check if user can read/write "$CONFIG_DIR"
	if [ ! -r "$CONFIG_DIR/WebGrab++.config.xml" ] || [ ! -w "$CONFIG_DIR/WebGrab++.config.xml" ]; then
		echo "You do not have read/write access in '$CONFIG_DIR'."
		print_help
		exit 1
	fi

	dotnet /opt/wg++/bin.net/WebGrab+Plus.dll "$CONFIG_DIR"
else
	#### User provided arguments to wg++ ####

	# Check if there is 1 argument. Exit if more
	if [ $# -ge 2 ]; then
		echo "Invalid path! You need to provide a path to WebGrabber+Plus configuration directory."
		print_help
		exit 1
	fi

	# Check if user asked for help
	if [ "$1" == "-h" ] || [ "$1" == "-H" ] || [ "$1" == "--help" ] || [ "$1" == "--HELP" ]; then
		print_help
		exit 0
	fi

	# Check if given parameter is existing directory
	if [ ! -d "$1" ]; then
		echo "Invalid path! You need to provide a path to WebGrabber+Plus configuration directory."
		print_help
		exit 1
	fi

	# Check if directory contains configuration file
	if [ ! -f "$1/WebGrab++.config.xml" ]; then
		echo "Wrong path! Your provided path does not contain configuration files."
		print_help
		exit 1
	fi

	# Check if user has read/write access to given path
	if [ ! -r "$1/WebGrab++.config.xml" ] || [ ! -w "$1/WebGrab++.config.xml" ]; then
		echo "You do not have read/write access to your given directory."
		print_help
		exit 1
	fi

	dotnet /opt/wg++/bin.net/WebGrab+Plus.dll "$1"
fi
