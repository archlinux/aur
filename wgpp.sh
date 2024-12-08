#!/usr/bin/env bash
# script: wg++ (WebGrab+Plus)
# author: Nikos Toutountzoglou, nikos.toutou@protonmail.com
# rev.date: 08/12/2024

# Variables
WGPP_USR=$(whoami)
WGPP_EXE=$(basename "$0")
WGPP_USR_HOME=$(getent passwd "$WGPP_USR" | cut -d: -f6)
WGPP_CFGDIR="$WGPP_USR_HOME/wg++"
WGPP_SYS="/usr/share/wg++"

# Functions
checkReq() {
	local packages=(dotnet libxml2 curl unzip sudo)
	for p in "${packages[@]}"; do
		if ! pacman -Qs "$p" >/dev/null; then
			printf "'%s' package is not installed. Exiting.\n" "$p"
			exit 1
		fi
	done
}

missingSysFiles() {
	if [[ ! -e "$WGPP_CFGDIR/install.sh" || ! -e "$WGPP_CFGDIR/run.net.sh" ]]; then
		cp -r -u "$WGPP_SYS"/* "$WGPP_CFGDIR" 2>/dev/null
		printf ":: Restored missing script files 'install.sh' and/or 'run.net.sh'.\n"
	fi
}

updateSiteIni() {
	if [[ -d "$WGPP_CFGDIR/siteini.pack" ]]; then
		printf ":: Starting update of '%s/siteini.pack' to latest release.\n" "$WGPP_CFGDIR"
		cd "$WGPP_CFGDIR/bin.net" || exit 1
		./SiteIni.Pack.Update.sh
	else
		printf ":: Error, cannot find folder 'siteini.pack'. Recreating folder.\n:: Please re-run 'update' of 'siteini.pack' now.\n"
		mkdir -v -p "$WGPP_CFGDIR/siteini.pack"
		exit 1
	fi
}

missingWGPPDir() {
	if [[ ! -d "$WGPP_CFGDIR" ]]; then
		printf ":: No '%s' working directory found for user '%s', exiting.\n" "$WGPP_EXE" "$WGPP_USR"
		exit 1
	fi
}

custFolder() {
	if [[ -z "$cust_dir" ]]; then
		printf ":: Empty custom directory input, exiting.\n"
		exit 1
	fi
	WGPP_CFGDIR=$(realpath "$cust_dir")
}

genFolder() {
	if [[ ! -d "$WGPP_CFGDIR" ]]; then
		cp -r "$WGPP_SYS" "$WGPP_CFGDIR"
		cd "$WGPP_CFGDIR" && sudo -u "$WGPP_USR" ./install.sh
		printf ":: Configuration folder '%s' created.\n" "$WGPP_CFGDIR"
		printf ":: It's now possible to configure 'WebGrab++.config.xml' and re-run '%s' to generate EPG data.\n" "$WGPP_EXE"
		exit 0
	else
		printf ":: Configuration folder '%s' already exists, exiting.\n" "$WGPP_CFGDIR"
		exit 1
	fi
}

runScript() {
	cd "$WGPP_CFGDIR" || exit 1
	sudo -u "$WGPP_USR" ./run.net.sh

	if [[ ! -e "$WGPP_CFGDIR/latest.xml" ]]; then
		printf ":: Error, cannot find latest EPG XML data file named 'latest.xml'. Exiting.\n"
		exit 1
	fi
	xmllint --format latest.xml >guide.xml
	exit 0
}

helpMsg() {
	printf "WebGrab+Plus EPG/XMLTV grabber
Usage: %s [-d|--dir <CUSTOM_DIR>] [-g|--generate] [-d <CUSTOM_DIR> -g] [-u|--update] [-d <CUSTOM_DIR> -u]
       %s -h|--help

Options:
  -d <CUSTOM_DIR>         Run from custom configuration folder <CUSTOM_DIR>.
  -g                      Create new configuration folder 'wg++' in user's home directory
  -d <CUSTOM_DIR> -g      Create new custom configuration folder <CUSTOM_DIR>
  -u                      Update to latest 'siteini.pack' and channel list files
  -d <CUSTOM_DIR> -u      Update custom configuration folder to latest 'siteini.pack' and channel list files.
  -h, --help              Show help\n" "$WGPP_EXE" "$WGPP_EXE"

	exit
}

# Argument parsing
args=("$@")

while [[ $# -ne 0 ]]; do
	case "$1" in
	-d | --dir)
		shift
		cust_dir="$1"
		custFolder
		;;
	-g | --generate)
		genFolder
		;;
	-u | --update)
		updateSiteIni
		exit 0
		;;
	-h | --help)
		helpMsg
		exit 1
		;;
	*)
		printf "Unknown argument '%s'\n" "$1"
		exit 1
		;;
	esac
	shift
done

# Run script
checkReq
missingWGPPDir
missingSysFiles
runScript
