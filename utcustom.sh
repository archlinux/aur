#!/bin/bash
#
# Unreal Tournament startup script
#

# Modifications by Eskild Hustvedt

# The user preferences directory
UT_PREFS="${HOME}/.loki/ut"
UT_DATA_PATH="/opt/ut/"

# Function to reveal osspd execution - not needed since patch 469b
#a=$(ps -U root | grep osspd) 
#if [ -z $a ]; then
#    notify-send UT -i ut "Please execute <p><b>service osspd start</b></p><p>or</p><b>systemctl start osspd.service</b>";
#    exit 1;
#fi

# Function to find the real directory a program resides in.
# Feb. 17, 2000 - Sam Lantinga, Loki Entertainment Software
FindPath()
{
    fullpath="`echo $1 | grep /`"
    if [ "$fullpath" = "" ]; then
        oIFS="$IFS"
        IFS=:
        for path in $PATH
        do if [ -x "$path/$1" ]; then
               if [ "$path" = "" ]; then
                   path="."
               fi
               fullpath="$path/$1"
               break
           fi
        done
        IFS="$oIFS"
    fi
    if [ "$fullpath" = "" ]; then
        fullpath="$1"
    fi
    # Is the awk/ls magic portable?
    if [ -L "$fullpath" ]; then
        fullpath="`ls -l "$fullpath" | awk '{print $11}'`"
    fi
    dirname $fullpath
}

# Set the home if not already set.
if [ "${UT_DATA_PATH}" = "" ]; then
    UT_DATA_PATH="`FindPath $0`/System"
fi

LD_LIBRARY_PATH=.:${UT_DATA_PATH}:${LD_LIBRARY_PATH}

export LD_LIBRARY_PATH
export UT_DATA_PATH

create_prefpath()
{
    path="${UT_PREFS}/$1"
    if [ ! -d "$path" ]; then
        echo "Creating directory $path"
        mkdir "$path"
    fi
}

copy_if_needed()
{
    dist="${UT_DATA_PATH}/$1"
    file="${UT_PREFS}/$1"
    if [ ! -f "$file" ]; then
        echo "Installing default $file"
        cp "$dist" "$file"
    fi
}

# Hey, it's fun time!
if [ ! -d ${HOME}/.loki ]
then
    mkdir ${HOME}/.loki
fi

if [ ! -d ${UT_PREFS} ]
then
    echo "Creating preferences directory..."
    create_prefpath
fi
create_prefpath System

# Flood the CPU for four seconds so that it is running at the currect speed
RandomFork () {
	while [ "$SECONDS" -le "4" ]; do
		let MYRND="$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM*$RANDOM$RANDOM+$RANDOM*$RANDOM/$RANDOM*$RANDOM"
	done
}
RandomFork &

# Let's boogie!
if [ -x "${UT_DATA_PATH}/System/ut-bin" ]
then
	echo -n "Sleeping for 1 second... ";sleep 1s;echo "done - launching UT"
	cd "${UT_DATA_PATH}/System"
	exec "./ut-bin" -log $*
fi
echo "Couldn't run Unreal Tournament (ut-bin). Is UT_DATA_PATH set?"
exit 1
