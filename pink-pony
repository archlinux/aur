#!/bin/sh

if [ $# -ge 1 ]; then
    /usr/share/pink-pony/Pony $1
else
    if [ ! -f ~/.config/pony-1.4.1.options ]; then
	    mkdir -p ~/.config/
        rm -f ~/.config/pony*.options
	    cp /usr/share/pink-pony/pony.options ~/.config/pony-1.4.1.options
    fi
    
    /usr/share/pink-pony/Pony ~/.config/pony-1.4.1.options
fi
