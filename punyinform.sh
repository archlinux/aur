#!/bin/sh
#
# This script passes the correct include_path to the Inform6 compiler
# for building games using the PunyInform Library.  Normally this script
# is automatically configured by the installing Makefile.
#
# This script was written by David Griffith <dave@661.org> in 2021 and
# released to the public domain.

# This is usually where the Inform6 libraries are installed.
# The installation process will fix this if necessary.
LIBPATH=/usr/local/share/inform

INFORM=inform
LIB=punyinform
LIBNAME="PunyInform"
NEWPATH=$LIBPATH/$LIB/lib
ZM_VERSION=-v3

MYNAME=`basename $0 ".sh"`

if [ "$MYNAME" != "$LIB" ] ; then
	VERSIONSTRING=`echo $MYNAME | sed s/$LIB//g`
	VERSION=`echo $VERSIONSTRING | sed s/^-//g`
	INFORM=$INFORM$VERSIONSTRING
else
	VERSION=`$INFORM -V | cut -d " " -f2`
fi

echo "Inform 6 Library Selection Wrapper by David Griffith."
echo "Using Inform version $VERSION."
echo "Using $LIBNAME library."

for ARG in "$@"; do
	case $ARG
	in
		-v*)
			ZM_VERSION=$ARG
			break
		;;
	esac
done

for ARG in "$@"; do
	if [ "$ZM_VERSION" != "$ARG" ] ; then
		LINE="$LINE $ARG"
	fi
done

FINAL="$ZM_VERSION +$NEWPATH $LINE"
$INFORM $FINAL
