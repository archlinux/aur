#!/bin/sh

available_memory="unknown"
default_min_memory=256
default_max_memory=512

if [ -e "/proc/meminfo" ]; then
	available_memory=$(grep MemFree: /proc/meminfo | awk '{ print $2; }')
	echo "Available memory: $available_memory kB"
else
	echo "Could not detect available memory. Will stick to default of $available_memory kB"
fi

# Test if the value is numeric before performing arithmetic on it
if [ $available_memory -eq $available_memory 2> /dev/null ]; then
	# We go with the defaults if memory is too low
	if [ $available_memory -gt 1048576 ]; then
		echo "There is more than 1 GB of free memory available. Will raise memory limits."
		echo "Will take a quarter as low limit and half as upper limit:"
		default_min_memory=$(($available_memory/1024/4))
		default_max_memory=$(($available_memory/1024/2))
	else
		echo "There is less than 1 GB of free memory available. Will keep default memory limits"
	fi
	echo "min: $default_min_memory MB, max: $default_max_memory MB"
fi

# To load all sources takes more than the default 64MB.
javaargs="-Xms${default_min_memory}m -Xmx${default_max_memory}m"
# Need to use config.ini in /usr/share/java/pcgen to find data
javaargs="$javaargs -Dpcgen.config=/usr/share/java/pcgen/"
pcgenargs=""
whosearg=pcgen

if [ "$#" -eq 1 ] && [ -f "$1" ]; then
    pcgenargs+=" -c "
    if echo "${1}" | grep '[ ]' > /dev/null; then
        pcgenargs+="\"${1}\""
    else
        pcgenargs+="${1}"
    fi
else
    while [ "x$1" != x ]; do
    echo "arg $1"
        case "${1}" in
        -h ) cat <<EOM
    usage: $0 ([pcgen options] [-- java options] | [/path/to/character.pcg])
        For java options, try 'java -h' and 'java -X -h'.
        Useful java property defines:
            -DBROWSER=/path/to/browser
            -Dpcgen.filter=/path/to/filter.ini
            -Dpcgen.options=/path/to/options.ini
            -Dpcgen.config=/path/to/config.ini
        List of PCGen options:
            -V          Print version and exit
            -G          Start in GMGen
            -N          Start in NPC Generation mode
            -v          Enable verbose output
            -s dir      Settings directory
            -m mode     Specify campaign mode
            -D [sheet]  Start showing the character sheet tab, optionally specifying the sheet to be used
            -E sheet    Export sheet to be used
            -p file     Party to be loaded
            -c file     Character to be loaded
            -o file     Output file
            -J          Ignore Java version checks
EOM
            exit 0
            ;;
        -- ) whosearg=java
            ;;
        * ) if [ "$whosearg" = java ]
            then
                javaargs+=" "
                if echo "${1}" | grep '[ ]' > /dev/null; then
                    javaargs+="\"${1}\""
                else
                    javaargs+="${1}"
                fi
            else
                pcgenargs+=" "
                if echo "${1}" | grep '[ ]' > /dev/null; then
                    pcgenargs+="\"${1}\""
                else
                    pcgenargs+="${1}"
                fi
            fi
            ;;
        esac
        shift
        done
fi
exec sh -c "\"$JAVA_HOME/bin/java\" $javaargs -jar /usr/share/java/pcgen/pcgen.jar $pcgenargs"