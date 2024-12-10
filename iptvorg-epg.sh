#!/usr/bin/env bash
# Script: iptvorg-epg (https://github.com/iptv-org/epg)
# Author: Nikos Toutountzoglou, nikos.toutou@protonmail.com
# Revision Date: 10/12/2024

# Variables
EPG_USR=$(whoami)
EPG_EXE=$(basename "$0")
EPG_USR_HOME=$(getent passwd "$EPG_USR" | cut -d: -f6)
EPG_SOURCE='/usr/share/iptvorg-epg'
EPG_SITESTAT='https://raw.githubusercontent.com/iptv-org/epg/master/SITES.md'
EPG_OUTPUT='guide.xml'
EPG_CMD="npm run grab -- "
EPG_VER="2023.12.1"

# Functions

# Check for required packages
checkReq() {
	local packages=(libxml2 nodejs npm sudo)
	for p in "${packages[@]}"; do
		if ! pacman -Qs "$p" >/dev/null; then
			printf "Error: '%s' package is not installed. Please install it and try again.\n" "$p"
			exit 1
		fi
	done
}

# Ensure configuration directory exists
checkDir() {
	EPG_CFGDIR=$(realpath "${custom_dir}" 2>/dev/null)
	if [[ -z "$EPG_CFGDIR" ]]; then
		printf "Error: Home directory of epg application not defined.\n"
		printf "Usage: %s -d <path> -s <site> --days <days> -o <output.xml>\n" "$EPG_EXE"
		printf "Run '%s --help' for more information.\n" "$EPG_EXE"
		exit 1
	fi

	if [[ ! -d "$EPG_CFGDIR" ]]; then
		printf "Notice: Directory '%s' not found. Creating...\n" "$EPG_CFGDIR"
		mkdir -p "$EPG_CFGDIR"
		cp "$EPG_SOURCE/my.channels.xml" "$EPG_CFGDIR"
		bsdtar --strip-components=1 -xzf "$EPG_SOURCE/epg-$EPG_VER.tgz" -C "$EPG_CFGDIR"
	fi
}

# Update the EPG data
updateEpg() {
	# Input validation
	if [[ "$channels_on" -eq 1 && "$site_on" -eq 1 ]]; then
		printf "Error: Cannot use both [-c|--channels] and [-s|--site] options simultaneously.\n"
		exit 1
	fi
	if [[ "$channels_on" -eq 0 && "$site_on" -eq 0 ]]; then
		printf "Error: Either [-c|--channels] or [-s|--site] must be specified.\n"
		exit 1
	fi

	# Prepare parameters
	local mychannel="" mysite="" mydays=""
	[[ "$channels_on" -eq 1 ]] && mychannel="--channels=$EPG_CCH"
	[[ "$site_on" -eq 1 ]] && mysite="--site=$EPG_SITE"
	[[ "$days_on" -eq 1 ]] && mydays="--days=$EPG_DAYS"

	# Validate output file extension
	if [[ "${EPG_OUTPUT##*.}" != "xml" ]]; then
		printf "Error: Output file must have '.xml' extension.\n"
		exit 1
	fi

	# Run the command
	cd "$EPG_CFGDIR" || exit
	sudo -u "$EPG_USR" $EPG_CMD $mysite $mychannel $mydays -o tmp_all.xml 2>/dev/null

	if [[ ! -f "tmp_all.xml" ]]; then
		printf "Error: Failed to create 'tmp_all.xml'.\n"
		exit 1
	fi

	# Format the XML and set ownership
	xmllint --format tmp_all.xml >"$EPG_OUTPUT"
	chown "$EPG_USR:$EPG_USR" "$EPG_OUTPUT"

	# Optionally compress the output
	if [[ "$gzip_on" -eq 1 ]]; then
		bsdtar -a -cf "${EPG_OUTPUT}.gz" tmp_all.xml 2>/dev/null
		printf "Notice: Created compressed file '%s.gz'.\n" "$EPG_OUTPUT"
	fi

	# Cleanup temporary files
	rm -f tmp_all.xml
	printf "Notice: Created EPG file '%s'.\n" "$EPG_OUTPUT"
}

# Display help message
helpMsg() {
	cat <<-EOF
		Usage: iptvorg-epg [options], outputs default: "guide.xml"

		Options:
		  -d, --dir <path>      Set home directory for iptvorg-epg (e.g., "epg")
		  -s, --site <name>     Specify the site to parse
		  -c, --channels <file> Specify custom *.channels.xml file (e.g., "my.channels.xml")
		                        (file should be in the epg home directory)
		  -o, --output <file>   Specify output file name (default: "guide.xml")
		  --days <days>         Override the number of days for program data
		  --gzip                Create a compressed version of the guide (default: false)
		  -ps, --printsites     Display available EPG sites
		  -h, --help            Display this help message
	EOF
	exit
}

# Print available sites
printSite() {
	curl -s "$EPG_SITESTAT"
	exit
}

# Initialize counter for -d
dir_count=0

args=("$@")
while [ $# -ne 0 ]; do
	name="$1"
	case "$name" in
	-d | --dir)
		# Increment the -d counter
		((dir_count++))
		if [[ $dir_count -gt 1 ]]; then
			printf "Error: The -d or --dir option can only be used once.\n"
			exit 1
		fi
		shift
		custom_dir="$1"
		;;
	-c | --channels)
		shift
		if [[ -z $1 ]] || [[ $1 == -* ]]; then break; fi
		EPG_CCH="$1"
		channels_on=1
		;;
	-s | --site)
		shift
		if [[ -z $1 ]] || [[ $1 == -* ]]; then break; fi
		EPG_SITE="$1"
		site_on=1
		;;
	-o | --output)
		shift
		if [[ -z $1 ]] || [[ $1 == -* ]]; then break; fi
		EPG_OUTPUT="$1"
		output_on=1
		;;
	--days)
		shift
		if [[ -z $1 ]] || [[ $1 == -* ]]; then break; fi
		EPG_DAYS="$1"
		days_on=1
		;;
	--gzip)
		gzip_on=1
		;;
	-h | --help)
		helpMsg
		;;
	-ps | --printsites)
		printSite
		;;
	*)
		break
		;;
	esac
	shift
done

# Main script
checkReq
checkDir
updateEpg
