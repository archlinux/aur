#!/bin/sh

# Configuration file for kps
export CONFIG_PATH

# Check for the config file's availability
if [ ! -z "$1" ]
then
  # The config path was given via an argument
  CONFIG_PATH="$1"
elif [ -e /opt/KeysPerSecond/config.kpsconf3 ]
then
  # The config file exists in the installation dir
  CONFIG_PATH="/opt/KeysPerSecond/config.kpsconf3"
fi

# The path passed as an argument is given priority
# over the config file in the installation dir, 
# meaning that even if the config file does exist
# in /opt/KeysPerSecond, if a different path is
# given as an argument, that path is the one
# that will be used

# Run Keys Per Second
if [ -z "$CONFIG_PATH" ]
then
  # No configuration path
  java -jar /opt/KeysPerSecond/KeysPerSecond.jar
  [ $? -ne 0 ] && notify-send "Keys Per Second" "Something went wrong..."
else
  # Available configuration path
  java -jar /opt/KeysPerSecond/KeysPerSecond.jar "$CONFIG_PATH"
  [ $? -ne 0 ] && notify-send "Keys Per Second" "Something went wrong..."
fi
