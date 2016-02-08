#!/bin/bash 
############################################################################
# Author 	: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
############################################################################


mksrcinfo
git add --all .

# Committing to the local repository with a message containing the time details
curtime=$(date)
git commit -m "commit from @ $curtime"

# Push the local snapshot to a remote destination
git push -u origin master