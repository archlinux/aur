#!/bin/bash
# Simple Adobe Air SDK wrapper script to use it as a simple AIR application launcher
# By Spider.007 / Sjon

if [[ -z "$1" ]]
then
	echo "Please supply an .air application as first argument"
	exit 1
fi

tmpdir=`mktemp -d /tmp/adobeair.XXXXXXXXXX`

echo "adobe-air: Extracting application to directory: $tmpdir"
mkdir -p $tmpdir
unzip -q $1 -d $tmpdir || exit 1

echo "adobe-air: Attempting to start application"
/opt/adobe-air-sdk/bin/adl -nodebug $tmpdir/META-INF/AIR/application.xml $tmpdir

echo "adobe-air: Cleaning up temporary directory"
rm -Rf $tmpdir && echo "adobe-air: Done"
