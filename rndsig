#!/bin/bash

#rndsig, Written by Storm Dragon
#Released under the terms of the WTFPL: http://wtfpl.net

#exit if root
if [ $(whoami) == "root" ] ; then
    echo "$(basename $0) should not be ran as root..."
    exit 0
fi

#Determine XDG path
if [ -z "$XDG_CONFIG_HOME" ] ; then
    XDG_CONFIG_HOME="$HOME/.config"
fi

#Make path for rndsig if it isn't there already
if ! [ -d "$XDG_CONFIG_HOME/rndsig" ] ; then
    mkdir -p "$XDG_CONFIG_HOME/rndsig"
fi

#program help
show_usage()
{
cat << EOF
Usage:
With no arguments rndsig displays your signature.
-h or --help, or any other arguments for that matter, shows this message.

Signature files go in your XDG_CONFIG_HOME/rndsig/ directory (usually ~/.config/rndsig/).
Files are called signature.ext where .ext determines how the signature will be displayed.
All files are optional.

Signature.2DigitDay-2DigitMonth: This file is displayed on the date specified by 2 digit month - 2 digit day.
If you wanted to wish everyone a happy new year, add the text happy new year to a file called signature.01-01
Holiday signatures are shown before any other signature info.

signature.all: the text from this file is displayed in all signatures. The whole file is placed inside the signature.
It is displayed first in the signature, unless there is a holiday signature.

signature.random: A line is chosen at random from this file and added to the signature after
the holiday message and after signature.all if they exist. Tabs are replaced with new lines.

signature.list: A single line is added from this file to your signature. The Lines are added in the order they appear in the
file. After the final line has been added, the lines start over from the beginning. Tabs are replaced with new lines. This file
appears last in your signature, below holidays, signature.all, and signature.random if they exist.
EOF
exit 0
}

#Deal with arguments:
if [ $# -gt 0 ] ; then
    show_usage
fi

#get Index for signature.list
if [ -f "$XDG_CONFIG_HOME/rndsig/count" ] ; then
    listIndex=$(cat "$XDG_CONFIG_HOME/rndsig/count")
    #Make sure our list number is in range.
    if [ -f "$XDG_CONFIG_HOME/rndsig/signature.list" ] ; then
     if [ "$listIndex" -gt "$(wc -l "$XDG_CONFIG_HOME/rndsig/signature.list" | tr -Cd "[:digit:]")" ] ; then
            listIndex=1
        fi
    fi
else
    listIndex=0
fi

#increment listIndex for the next time.
echo "$(($listIndex + 1))" > "$XDG_CONFIG_HOME/rndsig/count"

#Construct signature from files
#Holiday files are a special Case. Any signature file with a 2 digit month-day extension will be read placed at the top of the signature.
#For example, to have a signature on Halloween, name the file signature.10-31
#For example, to have a signature on CLI day, name the file signature.05-31
dateExtension="$(date +'%m-%d')"
if [ -f "$XDG_CONFIG_HOME/rndsig/signature.$dateExtension" ] ; then
    signature="$(cat "$XDG_CONFIG_HOME/rndsig/signature.$dateExtension")"
fi

#The signature.all file holds items for every signature and is the first thing in the signature. Itemse are displayed exactly as written.
if [ -f "$XDG_CONFIG_HOME/rndsig/signature.all" ] ; then
    if [ -n "$signature" ] ; then
        signature="$signature\n"
    fi
    signature="$signature$(cat "$XDG_CONFIG_HOME/rndsig/signature.all")"
fi

#The signature.random file holds items that should be added randomly, 1 per signature and is displayed second in the signature. Tabs are replaced with  new lines.
if [ -f "$XDG_CONFIG_HOME/rndsig/signature.random" ] ; then
    if [ -n "$signature" ] ; then
        signature="$signature\n"
    fi
    signature="$signature$(shuf -n 1 "$XDG_CONFIG_HOME/rndsig/signature.random" | sed 's/\t/\n/g')"
fi

#The signature.list file holds items that should be cycled through in order 1 at a time. Tabs are replaced with newlines in this file. It is shown last.
if [ -f "$XDG_CONFIG_HOME/rndsig/signature.list" ] ; then
    if [ -n "$signature" ] ; then
        signature="$signature\n"
    fi
    signature="$signature$(head -n $listIndex "$XDG_CONFIG_HOME/rndsig/signature.list" | tail -n 1 | sed 's/\t/\n/g')"
fi
echo -e "$signature"
exit 0
