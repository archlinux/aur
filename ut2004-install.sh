#! /bin/bash

if [ "$(whoami)" != "root" ]
then
    echo "Must be ran as root"
    exit 1
fi

export UT2004_PATH="/opt/ut2004"

# Create CD key file.
echo
printf "Enter CD Key [XXXXX-XXXXX-XXXXX-XXXXX]: "
read cd_key

echo "$cd_key" > "$UT2004_PATH"/System/CDkey

$UT2004_PATH/Scripts/ut2004-update
