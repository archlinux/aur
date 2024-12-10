#!/usr/bin/env bash
# script: wg++ (WebGrab+Plus)
# author: Nikos Toutountzoglou, nikos.toutou@protonmail.com
# rev.date: 10/12/2024

# Variables
WGPP_USR=$(whoami)
WGPP_EXE=$(basename "$0")
WGPP_USR_HOME=$(getent passwd "$WGPP_USR" | cut -d: -f6)
WGPP_CFGDIR="$WGPP_USR_HOME/wg++"
WGPP_SYS="/usr/share/wg++"

# Functions
checkReq() {
	# Ensure required packages are installed
	local packages=(dotnet libxml2 wget unzip sudo)
	for p in "${packages[@]}"; do
		if ! pacman -Qs "$p" >/dev/null; then
			printf "Error: Required package '%s' is not installed. Exiting.\n" "$p"
			exit 1
		fi
	done
}

missingSysFiles() {
	# Restore missing system files if needed
	if [[ ! -e "$WGPP_CFGDIR/install.sh" || ! -e "$WGPP_CFGDIR/run.net.sh" ]]; then
		cp -r -u "$WGPP_SYS"/* "$WGPP_CFGDIR" 2>/dev/null
		printf "Notice: Restored missing script files 'install.sh' and/or 'run.net.sh'.\n"
	fi
}

updateSiteIni() {
	# Update siteini.pack directory or recreate it if missing
	if [[ -d "$WGPP_CFGDIR/siteini.pack" ]]; then
		printf "Notice: Starting update of '%s/siteini.pack' to the latest release.\n" "$WGPP_CFGDIR"
		cd "$WGPP_CFGDIR/bin.net" || exit 1
		./SiteIni.Pack.Update.sh
	else
		printf "Notice: Error: Cannot find folder 'siteini.pack'. Recreating folder.\n"
		mkdir -vp "$WGPP_CFGDIR/siteini.pack"
		printf "Notice: Please re-run the update for 'siteini.pack'.\n"
		exit 1
	fi
}

missingWGPPDir() {
	# Exit if the working directory does not exist
	if [[ ! -d "$WGPP_CFGDIR" ]]; then
		printf "Notice: No working directory '%s' found for user '%s'. Exiting.\n" "$WGPP_CFGDIR" "$WGPP_USR"
		exit 1
	fi
}

custFolder() {
	if [[ -z "$cust_dir" ]]; then
		printf "Error: Empty custom directory input. Please specify a valid directory.\n" >&2
		exit 1
	fi

	# Resolve the absolute path of the custom directory
	WGPP_CFGDIR=$(realpath "$cust_dir" 2>/dev/null)

	# Create the directory if it doesn't exist
	if [[ ! -d "$WGPP_CFGDIR" ]]; then
		printf "Notice: Directory '%s' does not exist. Creating it now...\n" "$WGPP_CFGDIR"
		mkdir -p "$WGPP_CFGDIR"
		if [[ $? -ne 0 ]]; then
			printf "Error: Failed to create directory '%s'. Please check permissions.\n" "$WGPP_CFGDIR" >&2
			exit 1
		fi
	fi

	printf "Notice: Using configuration directory: '%s'\n" "$WGPP_CFGDIR"
}

genFolder() {
	# Create a new configuration folder if it doesn't exist
	if [[ ! -d "$WGPP_CFGDIR" ]]; then
		cp -r "$WGPP_SYS" "$WGPP_CFGDIR"
		cd "$WGPP_CFGDIR" && sudo -u "$WGPP_USR" ./install.sh
		printf "Notice: Configuration folder '%s' created.\n" "$WGPP_CFGDIR"
		printf "Notice: Configure 'WebGrab++.config.xml' and re-run '%s' to generate EPG data.\n" "$WGPP_EXE"
		exit 0
	else
		printf "Notice: Configuration folder '%s' already exists. Exiting.\n" "$WGPP_CFGDIR"
		exit 1
	fi
}

runScript() {
	# Execute the main script and ensure output XML is formatted
	cd "$WGPP_CFGDIR" || exit 1
	sudo -u "$WGPP_USR" ./run.net.sh

	if [[ ! -e "$WGPP_CFGDIR/latest.xml" ]]; then
		printf "Error: Missing EPG XML data file 'latest.xml'. Exiting.\n"
		exit 1
	fi
	xmllint --format latest.xml >guide.xml
	printf "Notice: EPG data saved as 'guide.xml'.\n"
	exit 0
}

helpMsg() {
	# Display help message
	cat <<EOF
WebGrab+Plus EPG/XMLTV Grabber
Usage: $WGPP_EXE [options]

Options:
  -d, --dir <CUSTOM_DIR>   Run from custom configuration folder <CUSTOM_DIR>.
  -g, --generate           Create new configuration folder 'wg++' in user's home directory.
  -u, --update             Update to the latest 'siteini.pack' and channel list files.
  -h, --help               Show this help message.

Examples:
  $WGPP_EXE -d <CUSTOM_DIR> -g   Create a custom configuration folder.
  $WGPP_EXE -d <CUSTOM_DIR> -u   Update the custom configuration folder.
  $WGPP_EXE -u                   Update the default configuration folder.

EOF
	exit 0
}

# Argument Parsing with Improvements
seen_dir=0 # Tracks if -d is provided multiple times
seen_generate=0 # Tracks if -g is provided
seen_update=0 # Tracks if -u is provided

while [[ $# -gt 0 ]]; do
	case "$1" in
	-d | --dir)
		shift
		if ((seen_dir)); then
			printf "Error: The '-d|--dir' option is specified more than once. Please provide it only once.\n" >&2
			exit 1
		fi
		cust_dir="$1"
		seen_dir=1
		custFolder # Ensure directory creation if necessary
		;;
	-g | --generate)
		if ((seen_generate)); then
			printf "Error: The '-g|--generate' option is specified more than once. Please provide it only once.\n" >&2
			exit 1
		fi
		seen_generate=1
		genFolder
		;;
	-u | --update)
		if ((seen_update)); then
			printf "Error: The '-u|--update' option is specified more than once. Please provide it only once.\n" >&2
			exit 1
		fi
		seen_update=1
		updateSiteIni
		exit 0
		;;
	-h | --help)
		helpMsg
		exit 0
		;;
	*)
		printf "Error: Unknown argument '%s'. Use -h or --help for usage information.\n" "$1" >&2
		exit 1
		;;
	esac
	shift
done

# Ensure valid combinations of options
if ((seen_generate && seen_update)); then
	printf "Error: The options '-g|--generate' and '-u|--update' cannot be used together.\n" >&2
	exit 1
fi

# Main Execution
checkReq
missingWGPPDir
missingSysFiles
runScript
