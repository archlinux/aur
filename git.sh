#!/bin/bash 
############################################################################
# Author 	: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
############################################################################

# icon cache
echo "Yltra-Flat"
gtk-update-icon-cache -t Yltra-Flat
echo "Yltra-Flat-Arch-Blue"
gtk-update-icon-cache Yltra-Flat-Arch-Blue
echo "Yltra-Flat-Majestic"
gtk-update-icon-cache Yltra-Flat-Majestic
echo "Yltra-Flat-Green"
gtk-update-icon-cache Yltra-Flat-Mint-Green
echo "Yltra-Flat-Orange"
gtk-update-icon-cache Yltra-Flat-Orange


mksrcinfo
git add --all .

# Committing to the local repository with a message containing the time details
curtime=$(date)
git commit -m "commit from @ $curtime"

# Push the local snapshot to a remote destination
git push -u origin master