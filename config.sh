#!/bin/sh
#---------------------------------------------------------------------------------
# variables for unattended script execution
#---------------------------------------------------------------------------------

#---------------------------------------------------------------------------------
# Select package
#---------------------------------------------------------------------------------
#   0: User selects manually
#   1: devkitARM
#   2: devkitPPC
#   3: devkitA64
#---------------------------------------------------------------------------------
BUILD_DKPRO_PACKAGE=2

#---------------------------------------------------------------------------------
# Toolchain installation directory, comment if not specified
#---------------------------------------------------------------------------------
#BUILD_DKPRO_INSTALLDIR=/opt/devkitpro
#BUILD_DKPRO_INSTALLDIR=c:/devkitPro

#---------------------------------------------------------------------------------
# Path to previously downloaded source packages, comment if not specified
#---------------------------------------------------------------------------------
#BUILD_DKPRO_SRCDIR=~/projects/archives

#---------------------------------------------------------------------------------
# MAKEFLAGS for building - use number of processors for jobs
#---------------------------------------------------------------------------------
#numcores=`getconf _NPROCESSORS_ONLN`
#export MAKEFLAGS="$MAKEFLAGS -j${numcores}"

#---------------------------------------------------------------------------------
# Uncomment to skip building of crtls and rules files
#---------------------------------------------------------------------------------
BUILD_DKPRO_SKIP_CRTLS=1

# Automated script execution
#---------------------------------------------------------------------------------
#  0: Ask to delete build folders & patched sources
#  1: Use defaults, don't pause for answers
#---------------------------------------------------------------------------------
BUILD_DKPRO_AUTOMATED=1

#---------------------------------------------------------------------------------
# set OSX SDK path if needed
#---------------------------------------------------------------------------------
#export OSXSDKPATH=/Library/Developer/CommandLineTools/SDKs/MacOSX10.12.sdk