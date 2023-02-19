#!/bin/bash
# script: wg++ (WebGrab+Plus)
# author: Nikos Toutountzoglou, nikos.toutou@gmail.com
# rev.date: 19/02/2023

# vars
WGPP_USR=$(whoami)
WGPP_EXE=$(basename $0)
WGPP_USR_HOME=$(getent passwd "$WGPP_USR" | cut -d: -f6)
WGPP_CFGDIR=$WGPP_USR_HOME/wg++
WGPP_SYS=/usr/share/wg++

# functions
helpMsg() {
	echo "WebGrab+Plus EPG/XMLTV grabber"
	echo "Usage: $WGPP_EXE [-d|--dir <CUSTOM_DIR>] [-g|--generate] [-d <CUSTOM_DIR> -g] [-u|--update] [-d <CUSTOM_DIR> -u]"
	echo "       $WGPP_EXE -h|-?|--help"
	echo
	echo "Options:"
	echo "  -d <CUSTOM_DIR>         Run from custom configuration folder <CUSTOM_DIR>."
	echo "  -g                      Create new configuration folder 'wg++' in user's home directory."
	echo "  -d <CUSTOM_DIR> -g      Create new custom configuration folder <CUSTOM_DIR>."
	echo "  -u                      Update to latest 'siteini.pack' and channel list files."
	echo "  -d <CUSTOM_DIR> -u      Update custom configuration folder to latest 'siteini.pack' and channel list files."
}

missingSysFiles() {
	if [ ! -e "$WGPP_CFGDIR/install.sh" -o ! -e "$WGPP_CFGDIR/run.net.sh" ]; then
		cp -r -u $WGPP_SYS/* "$WGPP_CFGDIR" 2>/dev/null
		echo ":: Restored missing script files 'install.sh' and/or 'run.net.sh'."
	fi
}

missingWGPPDir() {
	if [ ! -d "$WGPP_CFGDIR" ]; then
		echo ":: No '$WGPP_EXE' working directory found for user '$WGPP_USR', exiting."
		exit 1
	fi
}

custFolder() {
	if [[ -z "$cust_dir" ]]; then
		echo ":: Empty custom directory input, exiting."
		exit 1
	fi
	WGPP_CFGDIR=$(realpath "$cust_dir")
}

genFolder() {
	if [ ! -d "$WGPP_CFGDIR" ]; then
		cp -r $WGPP_SYS "$WGPP_CFGDIR"
		cd "$WGPP_CFGDIR" && sudo -u $WGPP_USR ./install.sh
		echo ":: Configuration folder '$WGPP_CFGDIR' created."
		echo ":: It's now possible to configure 'WebGrab++.config.xml' and re-run '$WGPP_EXE' to generate EPG data."
		exit 0
	else
		echo ":: Configuration folder '$WGPP_CFGDIR' already exists, exiting."
		exit 1
	fi
}

updateSiteIni() {
	SITEINI_URL="https://github.com/SilentButeo2/webgrabplus-siteinipack/trunk/siteini.pack"
	
	if ! type svn > /dev/null; then
		echo ":: Subversion (svn) is not installed. Please install it first before updating 'siteini.pack'."
		exit 1
	fi

	if [ -d "$WGPP_CFGDIR/siteini.pack" ]; then
		echo ":: Starting update of '$WGPP_CFGDIR/siteini.pack' to latest version."
		cd "$WGPP_CFGDIR"
		svn checkout $SITEINI_URL
	else
		echo ":: Missing folder 'siteini.pack', exiting."
		exit 1
	fi
}

runScript() {
	cd "$WGPP_CFGDIR"
	sudo -u $WGPP_USR ./run.net.sh
}

# args
args=("$@")

while [ $# -ne 0 ]
do
	case "$1" in
		-d|--dir|-[Dd]ir)
			shift
			cust_dir="$1"
			custFolder
			;;
		-g|--generate|-[Gg]enerate)
			genFolder
			;;
		-u|--update|-[Uu]pdate)
			updateSiteIni
			exit 0
			;;
		-?|--?|-h|--help|-[Hh]elp)
			helpMsg
			exit 1
			;;
		*)
			echo "Unknown argument '$1'"
			exit 1
			;;
	esac
	shift
done

# run script
missingWGPPDir
missingSysFiles
runScript
