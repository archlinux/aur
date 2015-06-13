#!/bin/sh
#######################################################
#
# Startscript for Varkon
# Version: 2.0
# OS: Unix
# Languages: English, Swedish
#
# See the comments below for instructions on
# how to configure your installation.
#
# URL:  http://varkon.sourceforge.net
# (C)2007 J.Kjellander
#
#######################################################

if [ `Xdialog --stdout --no-cancel --no-tags --title "Question" --menubox "Choose language" 10 25 1 1 English 2 Swedish` == 1 ] ; then
	language="english"
else
	language="swedish"
fi

# Root directory for VARKON installation.
# Alternative 1, relative path.
VARKON_ROOT=`(cd $(dirname $0); cd ..; cd ..; cd opt/varkon; pwd)`
# Alternative 2, explicit path.
# VARKON_ROOT=/home/username/varkon/varkon_2.Xx
export VARKON_ROOT

VARKON_HOME=$HOME/varkon
export VARKON_HOME

## --- Creating directory VARKON_HOME ---
echo "Verifying directory  VARKON_HOME"
if [ -d $VARKON_HOME ] ; then
	echo "      the directory exists"
else
	echo "      this will create the VARKON_HOME directory"
	echo "       and sub_directories lib tmp cnf/plt"
	mkdir $VARKON_HOME
	cd $VARKON_HOME
	mkdir lib cnf cnf/plt
fi
echo "directory $VARKON_HOME verifyed"

# Module library path (*.MBO)
# Varkon first searches the active job directory, jobdir,
# then jobdir/lib and finally the path defined in
# VARKON_LIB. VARKON_LIB may specify up to 10 paths
# separated by colon ":". It is advisable to let
# VARKON_LIB end with the path to the system library.
VARKON_LIB=$VARKON_HOME/lib:$VARKON_ROOT/lib
export VARKON_LIB

# The following line is an example that includes
# an additional directory in the path.
# VARKON_LIB=/home/username/my_library:$VARKON_ROOT/lib

# Menufile to load at startup.
VARKON_MDF=$VARKON_ROOT/mdf/${language}/x11.MDF
export VARKON_MDF

# Errormessages   (*.ERM)
VARKON_ERM=$VARKON_ROOT/erm
export VARKON_ERM

# The VARKON documentation (*.htm)
VARKON_DOC=$VARKON_ROOT/man
export VARKON_DOC

# Temporary files
# This line may be changed to /tmp or wherever you
# like to keep temporary files. On a network this
# directory should usually reside on the local machine
# so you may set it up differently for different users.
# All users need write access to this directory
VARKON_TMP=/tmp
export VARKON_TMP

# Fonts for graphical text
VARKON_FNT=$VARKON_ROOT/cnf/fnt
export VARKON_FNT

# Plotter configuration
# You may change this location to some other place
# like $HOME/cnf/plt if you want to reuse an old
# configuration when installing a new version of VARKON.
# All users need write access to this directory
VARKON_PLT=$VARKON_HOME/cnf/plt:$VARKON_ROOT/cnf/plt
export VARKON_PLT

# Icon bitmaps
VARKON_ICO=$VARKON_ROOT/cnf/icons
export VARKON_ICO

# Tolerances
VARKON_TOL=$VARKON_ROOT/cnf/tol
export VARKON_TOL

# Standard resources for X-Windows
VARKON_INI=$VARKON_ROOT/cnf/ini/${language}
export VARKON_INI

# PATH for executables (xvarkon, mbsc and plotterdrivers)
VARKON_BIN=$VARKON_ROOT/bin
export VARKON_BIN

# Path to shared ODBC Library. Uncomment these 2 lines
# and set the path to your ODBC libraries if you have
# compiled Varkon with ODBC support.

#LD_LIBRARY_PATH=/usr/lib/unixODBC
#export LD_LIBRARY_PATH

# Start the VARKON executable with GLOBAL as default for new jobs.
# Add an extra ini-file with your own configuration
# if you want to. Don't edit the standard ini-file included
# in the distribution or you will have to do it all
# over again when updating the system.
$VARKON_BIN/xvarkon -GLOBAL -jd$VARKON_HOME -i$VARKON_INI/linux

# With an inifile of your own it would look something
# like the following:

# $VARKON_BIN/xvarkon -GLOBAL  \
# -i$VARKON_INI/linux -i$HOME/cnf/ini/english/my_own_inifile

# If you want to run the system in EXPLICIT mode only, add
# "-EXPLICIT" to the command line and the system will not
# prompt for this every time you start.
# $VARKON_BIN/xvarkon -EXPLICIT -i$VARKON_INI/linux
#
# You can also use -GENERIC to force the system to start
# in generic mode.
#
# If you want to specify a default job directory use the -jd
# option on the command line. Here is an example:
# $VARKON_BIN/xvarkon -GLOBAL -jd /home/my_directory/my_varkon_jobs
