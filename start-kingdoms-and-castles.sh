#!/bin/bash
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/gog-kingdoms-and-castles"
if [ $(uname -m) == "x86_64" ]
then
	/opt/gog-kingdoms-and-castles/KingdomsAndCastles.x86_64
else
	/opt/gog-kingdoms-and-castles/KingdomsAndCastles.x86
fi
