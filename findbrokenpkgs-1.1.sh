#! /bin/bash
# Distributed under the terms of the GNU General Public License v2

# Shamelessly copied mostly from Gentoo's revdep-rebuild utility.
# http://sources.gentoo.org/viewcvs.py/gentoo-x86/app-portage/gentoolkit/
# $ equery belongs /usr/bin/revdep-rebuild
# app-portage/gentoolkit-0.2.3-r1
# $ cat /usr/portage/app-portage/gentoolkit/gentoolkit-0.2.3-r1.ebuild | grep LICENSE
# LICENSE="GPL-2"

# findbrokenpkgs for Arch Linux.
# Converted to use pacman instead of emerge by Paul Bredbury <brebs@sent.com>
#
# v1.1 - files now in $HOME/.findbrokenpkgs/ directory - based on changes from
# Stefan Husmann, repackaged by Jaroslav Lichtblau

# Customizable variables:
#
# LD_LIBRARY_MASK - Mask of specially evaluated libraries
# SEARCH_DIRS - List of directories to search for executables and libraries
# SEARCH_DIRS_MASK - List of directories to not search
#
# These variables can be prepended to by setting the variable in
# your environment prior to execution.
#
# An entry of "-*" means to clear the variable from that point forward.
# Example: env SEARCH_DIRS="/usr/bin -*" findbrokenpkgs will set SEARCH_DIRS
# to contain only /usr/bin

if [ "$1" = "-h" -o "$1" = "-help" -o "$1" = "--help" ] ; then
	echo "Broken package identifier, version 1.0"
	echo "Checks dynamic library linking."
	echo
	echo "Usage: $0 [OPTIONS]"
	echo
	echo " -nc, --no-color       Turn off colored output"
	echo " -nw, --no-warning     Disable newbie-friendly warning"
	echo "  -q, --quiet          Be less verbose"
	echo
	echo "Report bugs to http://bbs.archlinux.org/viewtopic.php?id=13882"
	exit 0
fi

# Update the incremental variables using /etc/profile.env, /etc/ld.so.conf,
# and the environment.

# Read the incremental variables from environment
PRELIMINARY_SEARCH_DIRS="$SEARCH_DIRS"
PRELIMINARY_SEARCH_DIRS_MASK="$SEARCH_DIRS_MASK"
PRELIMINARY_LD_LIBRARY_MASK="$LD_LIBRARY_MASK"
SONAME_SEARCH="not found"
SONAME_GREP=grep

# Add the defaults
if [ -d /etc/findbrokenpkgs ] ; then
	for file in $(ls /etc/findbrokenpkgs) ; do
		PRELIMINARY_SEARCH_DIRS="$PRELIMINARY_SEARCH_DIRS $(. /etc/findbrokenpkgs/${file}; echo $SEARCH_DIRS)"
		PRELIMINARY_SEARCH_DIRS_MASK="$PRELIMINARY_SEARCH_DIRS_MASK $(. /etc/findbrokenpkgs/${file}; echo $SEARCH_DIRS_MASK)"
		PRELIMINARY_LD_LIBRARY_MASK="$PRELIMINARY_LD_LIBRARY_MASK $(. /etc/findbrokenpkgs/${file}; echo $LD_LIBRARY_MASK)"
	done
else
	PRELIMINARY_SEARCH_DIRS="$PRELIMINARY_SEARCH_DIRS /bin /sbin /usr/bin /usr/sbin /lib* /usr/lib*"
	# openoffice is a binary, and we don't want to check that monster
	PRELIMINARY_SEARCH_DIRS_MASK="$PRELIMINARY_SEARCH_DIRS_MASK /opt/openoffice"
	# Binary libraries
	PRELIMINARY_LD_LIBRARY_MASK="$PRELIMINARY_LD_LIBRARY_MASK libodbcinst.so libodbc.so libjava.so libjvm.so"
fi

# Get the ROOTPATH and PATH from /etc/profile.env
if [ -e "/etc/profile.env" ] ; then
	PRELIMINARY_SEARCH_DIRS="$PRELIMINARY_SEARCH_DIRS $((. /etc/profile.env; echo ${ROOTPATH}:${PATH}) | tr ':' ' ')"
fi

# Get the directories from /etc/ld.so.conf
if [ -e /etc/ld.so.conf ] ; then
	PRELIMINARY_SEARCH_DIRS="$PRELIMINARY_SEARCH_DIRS $(grep -v "^#" /etc/ld.so.conf | tr '\n' ' ')"
fi

# Set the final variables
# Note: Using $(echo $variable) removes extraneous spaces from variable assignment
unset SEARCH_DIRS
for i in $(echo $PRELIMINARY_SEARCH_DIRS) ; do
	[ "$i" = "-*" ] && break
	# Append a / at the end so that links and directories are treated the same by find
	# Remove any existing trailing slashes to prevent double-slashes
	SEARCH_DIRS="$(echo $SEARCH_DIRS ${i/%\//}/)"
done
# Remove any double-slashes from the path
SEARCH_DIRS="$(echo $SEARCH_DIRS | sed 's:/\+:/:g')"

unset SEARCH_DIRS_MASK
for i in $(echo $PRELIMINARY_SEARCH_DIRS_MASK) ; do
	[ "$i" = "-*" ] && break
	SEARCH_DIRS_MASK="$(echo $SEARCH_DIRS_MASK $i)"
done

unset LD_LIBRARY_MASK
for i in $(echo $PRELIMINARY_LD_LIBRARY_MASK) ; do
	[ "$i" = "-*" ] && break
	LD_LIBRARY_MASK="$(echo $LD_LIBRARY_MASK $i)"
done

# Base of temporary files names.
[ -d ${HOME}/.findbrokenpkgs ] || mkdir ${HOME}/.findbrokenpkgs
touch ${HOME}/.findbrokenpkgs/findbrokenpkgs_0.test 2>/dev/null
if [ $? -eq 0 ] ; then
	LIST="${HOME}/.findbrokenpkgs/findbrokenpkgs"
	rm ~/.findbrokenpkgs/findbrokenpkgs_0.test
else
	# Try to use /var/tmp since $HOME is not available
	touch /var/tmp/.findbrokenpkgs/findbrokenpkgs_0.test 2>/dev/null
	if [ $? -eq 0 ] ; then
	LIST="/var/tmp/.findbrokenpkgs/findbrokenpkgs"
	rm /var/tmp/.findbrokenpkgs/findbrokenpkgs_0.test
	else
		echo
		echo "!!! Unable to write temporary files to either $HOME or /var/tmp !!!"
		echo
		exit 1
	fi
fi

shopt -s nullglob
shopt -s expand_aliases
unalias -a
alias echo_v=echo

while [ ! -z "$1" ] ; do
	case "$1" in
	-q | --quiet )
		alias echo_v=:
		shift
		;;
	-nc | --no-color )
		NOCOLOR=true
		shift
		;;
	-nw | --no-warning )
		NOWARNING=true
		shift
		;;
	* )
		echo "Unknown option:  $1"
		exit 1
		;;
	esac
done

# Color Definitions
if [ "$NOCOLOR" = "yes" -o "$NOCOLOR" = "true" ] ; then
	NO=""
	BR=""
	CY=""
	GR=""
	RD=""
	YL=""
	BL=""
else
	NO="\x1b[0m"
	BR="\x1b[0;01m"
	CY="\x1b[36;01m"
	GR="\x1b[32;01m"
	RD="\x1b[31;01m"
	YL="\x1b[33;01m"
	BL="\x1b[34;01m"
fi

function set_trap () {
	trap "rm_temp $1" SIGHUP SIGINT SIGQUIT SIGABRT SIGTERM
}

function rm_temp () {
	echo " terminated."
	echo "Removing incomplete $1."
	rm $1
	echo
	exit 1
}

# Want program results (especially from pacman) in English
export LC_ALL=C

# Always delete the temporary files from a previous run
rm -f ${LIST}.[0-9]_*

# Clean up no longer needed environment variables
unset PREVIOUS_SEARCH_DIRS PREVIOUS_SEARCH_DIRS_MASK PREVIOUS_LD_LIBRARY_MASK PREVIOUS_PREVIOUS_OPTIONS
unset PRELIMINARY_SEARCH_DIRS PRELIMINARY_SEARCH_DIRS_MASK PRELIMINARY_LD_LIBRARY_MASK

# Log our environment
echo "SEARCH_DIRS=\"$SEARCH_DIRS\"" > $LIST.0_env
echo "SEARCH_DIRS_MASK=\"$SEARCH_DIRS_MASK\"" >> $LIST.0_env
echo "LD_LIBRARY_MASK=\"$LD_LIBRARY_MASK\"" >> $LIST.0_env

echo_v
echo_v "Checking reverse dependencies..."
echo_v
echo_v -n -e "${GR}Collecting system binaries and libraries...${NO}"

set_trap "$LIST.1_*"

# Be extra paranoid and pipe results through sed to remove multiple slashes
# using -perm /u+x for find command
find $SEARCH_DIRS -type f \( -perm /u+x -o -name '*.so' -o -name '*.so.*' -o -name '*.la' \) 2>/dev/null | sort | uniq | sed 's:/\+:/:g' >$LIST.0_files

# Remove files that match SEARCH_DIR_MASK
for dir in $SEARCH_DIRS_MASK ; do
	grep -v "^$dir" $LIST.0_files > $LIST.1_files
	mv $LIST.1_files $LIST.0_files
done

mv $LIST.0_files $LIST.1_files
echo_v -e " ${GR}done.${NO}\n  ($LIST.1_files)"

echo_v
echo_v -n -e "${GR}Collecting complete LD_LIBRARY_PATH...${NO}"
set_trap "$LIST.2_ldpath"
# Ensure that the "trusted" lib directories are at the start of the path
(
	echo /lib* /usr/lib* | sed 's/ /:/g'
	sed '/^#/d;s/#.*$//' </etc/ld.so.conf
	sed 's:/[^/]*$::' <$LIST.1_files | sort -ru
) | tr '\n' : | tr -d '\r' | sed 's/:$//' >$LIST.2_ldpath
echo_v -e " ${GR}done.${NO}\n  ($LIST.2_ldpath)"
COMPLETE_LD_LIBRARY_PATH="$(cat $LIST.2_ldpath)"

echo_v
echo_v -e "${GR}Checking dynamic linking consistency...${NO}"
set_trap "$LIST.3_rebuild"
LD_MASK="\\(	$(echo "$LD_LIBRARY_MASK" | sed 's/\./\\./g;s/ / \\|	/g') \\)"
echo -n > $LIST.3_rebuild
cat $LIST.1_files | egrep -v '*\.la$' | while read FILE ; do
	# Note: double checking seems to be faster than single
	# with complete path (special add-ons are rare).
	if ldd "$FILE" 2>/dev/null | grep -v "$LD_MASK" | $SONAME_GREP -q "$SONAME_SEARCH" ; then
		if LD_LIBRARY_PATH="$COMPLETE_LD_LIBRARY_PATH" ldd "$FILE" 2>/dev/null | grep -v "$LD_MASK" | $SONAME_GREP -q "$SONAME_SEARCH" ; then
			# Only build missing direct dependencies
			ALL_MISSING_LIBS=$(ldd "$FILE" 2>/dev/null | sort -u | sed -n 's/	\(.*\) => not found/\1/p' | tr '\n' ' ' | sed 's/ $//' )
			REQUIRED_LIBS=$(objdump -x $FILE | grep NEEDED | awk '{print $2}' | tr '\n' ' ' | sed 's/ $//')
			MISSING_LIBS=""
			for lib in $ALL_MISSING_LIBS ; do
				if echo $REQUIRED_LIBS | grep -q $lib ; then
					MISSING_LIBS="$MISSING_LIBS $lib"
				fi
			done
			if [ "$MISSING_LIBS" != "" ] ; then
				echo "$FILE" >> $LIST.3_rebuild
				# MISSING_LIBS already starts with a space
				echo_v -e "  $FILE ${RD}needs missing${NO}${MISSING_LIBS}"
			fi
		fi
	fi
done
# Not sure if *.la files should even be checked
cat $LIST.1_files | egrep '*\.la$' | while read FILE ; do
	for depend in $(grep '^dependency_libs' $FILE | awk -F'=' '{print $2}' | sed "s/'//g") ; do
		[ ${depend:0:1} != '/' ] && continue
		if [ ! -e $depend ] ; then
			echo "$FILE" >> $LIST.3_rebuild
			echo_v -e "  $FILE ${RD}needs missing${NO} ${depend}"
		fi
	done
done
echo_v -e " ${GR}done${NO}.\n  ($LIST.3_rebuild)"

echo_v
echo_v -n -e "${GR}Assigning files to packages...${NO}"
set_trap "$LIST.4_*"
echo -n > $LIST.4_package_owners
echo -n > $LIST.4_packages_raw
echo -n > $LIST.4_orphans

cat $LIST.3_rebuild | while read FILE ; do
	EXACT_PKG=$(pacman -Qo $FILE | awk '{print $5 " " $6}')
	PKG=$(echo $EXACT_PKG | awk '{print $1}')
	if [ -z "$PKG" ] ; then
		echo_v -n -e "\n  ${RD}*** $FILE is orphan & broken! ***${NO}"
		echo "$FILE -> (none)" >> $LIST.4_package_owners
		echo "$FILE" >> $LIST.4_orphans
		echo_v -n -e "\n  $FILE ${RD}-> (none)${NO}"
	else
		echo "$PKG" >> $LIST.4_packages_raw
		echo "$FILE -> $EXACT_PKG" >> $LIST.4_package_owners
		echo_v -n -e "\n  $FILE ${CY}->${NO} ${BR}$PKG${NO}"
	fi
done
echo_v
echo_v -e " ${GR}done.${NO}\n  ($LIST.4_*)"

echo_v
echo_v -n -e "${GR}Cleaning list of packages to rebuild...${NO}"
set_trap "$LIST.5_packages"
sort -u $LIST.4_packages_raw >$LIST.5_packages
echo_v -e " ${GR}done.${NO}\n  ($LIST.5_packages)"

REBUILD_LIST="$(cat $LIST.5_packages | tr '\n' ' ')"
ORPHAN_LIST="$(cat $LIST.4_orphans)"

# Clean up no longer needed environment variables
unset COMPLETE_LD_LIBRARY_PATH SEARCH_DIRS SEARCH_DIRS_MASK LD_LIBRARY_MASK

trap - SIGHUP SIGINT SIGQUIT SIGABRT SIGTERM

if [ -z "$REBUILD_LIST" ] && [ -z "$ORPHAN_LIST" ] ; then
	echo_v -e "\n${GR}Dynamic linking on your system is consistent.${NO}"
	# All OK, so delete temporary files
	rm -f ${LIST}.[0-9]_*
else
	# Show broken files & packages
	if [ -n "$ORPHAN_LIST" ] ; then
		echo -e "\n${RD}Orphaned broken files:${NO}"
		echo "$ORPHAN_LIST"
		echo_v -e "\n${GR}This list of orphaned broken files is in $LIST.4_orphans${NO}"
	fi
	if [ -n "$REBUILD_LIST" ] ; then
		echo -e "\n${RD}Recompile these packages:${NO}"
		echo -e "${BR}$REBUILD_LIST${NO}"
		if ! [ "$NOWARNING" = "yes" -o "$NOWARNING" = "true" ] ; then
			echo_v -e "\nSome/all breakages may be ${GR}OK${NO} - this program cannot distinguish between ${RD}required${NO}"
			echo_v -e "and ${GR}optional${NO} dependencies. See http://bbs.archlinux.org/viewtopic.php?id=13882"
		fi
	fi
	# The temporary files are deliberately not deleted, as a source of info
fi

exit 0
