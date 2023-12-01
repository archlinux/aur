#!/bin/bash
# script: iptvorg-epg (https://github.com/iptv-org/epg)
# author: Nikos Toutountzoglou, nikos.toutou@protonmail.com
# rev.date: 30/11/2023

# Variables
EPG_USR=$(whoami)
EPG_EXE=$(basename $0)
EPG_USR_HOME=$(getent passwd "$EPG_USR" | cut -d: -f6)
EPG_SOURCE='/usr/share/iptvorg-epg'
EPG_SITESTAT='https://raw.githubusercontent.com/iptv-org/epg/master/SITES.md'
EPG_OUTPUT='guide.xml'
EPG_CMD="npm run grab -- "

# Functions
checkReq() {
# Check all requirements
local packages=(python libxml2 nodejs npm)
for p in ${packages[@]}; do
	if ! pacman -Qs ${p} > /dev/null; then
		echo "'${p}' package is not installed. Exiting."
		exit 1
	fi
done
}

checkDir() {
# Check if home directory variable is defined
EPG_CFGDIR=$(realpath ${custom_dir} 2>/dev/null)
if [ -z $EPG_CFGDIR ]; then
	printf "\nHome directory of epg application not defined, use [-d, --dir] <path> option.\nExample usage: $EPG_EXE -d <path> -s <site> --days <days> -o <output.xml>\nUse [-h|--help] to display usage, [-ps] to display available epg sites.\n"
	exit 1
fi

# Create HOMEDIR directory if it doesn't exist
if [ ! -d "$EPG_CFGDIR" ]; then
	echo ":: '$EPG_CFGDIR' is missing, creating new directory."

	# Normal copy from /usr/share/iptvorg-epg
	cp -r $EPG_SOURCE $EPG_CFGDIR
fi
}

updateEpg() {
# Input variables
# Both -c and -s defined
if [ $channels_on = 1 -a $site_on = 1 ]; then
	echo "Cannot use expression [-c|--channels] and [-s|--site] at the same time, use one of them."
	exit 1
fi

# No -c and -s defined
if [ $channels_on = 0 -a $site_on = 0 ]; then
	echo "Missing expression [-c|--channels] or [-s|--site], use one of them."
	exit 1
fi

# -c defined
if [ $channels_on = 1 ]; then
	mychannel="--channels=$EPG_CCH "
else
	mychannel=""
fi

# -s defined
if [ $site_on = 1 ]; then
	mysite="--site=$EPG_SITE "
else
	mysite=""
fi

# --days defined
if [ $days_on = 1 ]; then
	mydays="--days=$EPG_DAYS "
else
	mydays=""
fi

# Check -o file ending is '.xml'
if [[ ! ".$(echo "$EPG_OUTPUT"| awk -F. '{print $NF}')" == ".xml" ]]; then
	echo "Wrong output file format detected, please use file ending '.xml'."
	exit 1
fi

# Collect epg data in xml-format
cd $EPG_CFGDIR
sudo -u $EPG_USR $EPG_CMD $mysite $mychannel $mydays -o tmp_all.xml 2>/dev/null

# Exit if no output file is created
if [ ! -f "$EPG_CFGDIR/tmp_all.xml" ]; then
	echo ":: Failed to create '$EPG_CFGDIR/$EPG_OUTPUT'."
	exit 1
fi

# Pretty format xml file
xmllint --format tmp_all.xml > $EPG_OUTPUT
chown $EPG_USR:$EPG_USR $EPG_OUTPUT

# --gzip defined
if [ $gzip_on = 1 ]; then
	bsdtar -a -cf "$EPG_OUTPUT.gz" "$EPG_CFGDIR/tmp_all.xml" 2>/dev/null
	echo ":: Created gzip file '$EPG_CFGDIR/$EPG_OUTPUT.gz'."
fi

# Cleanup directory
rm -f $EPG_CFGDIR/tmp_all.xml 2>/dev/null

echo ":: Created epg-xml file '$EPG_CFGDIR/$EPG_OUTPUT'."
}

helpMsg() {
printf 'Usage: iptvorg-epg [options], outputs default: "guide.xml"

Options:
  -d, --dir <path>              Home directory of iptvorg-epg (suggestion: "epg")
  -s, --site <name>             Name of the site to parse
  -c, --channels <file>         File name of custom *.channels.xml file (example: "my.channels.xml")
                                (location inside iptvorg-epg home directory)
  -o, --output <file>           File name of output file (default: "guide.xml")
                                (output location inside iptvorg-epg home directory)
  --days <days>                 Override the number of days for which the program will be loaded
                                (defaults to the value from the site config)
  --gzip                        Create a compressed version of the guide as well (default: false)
  -ps, --printsites             Show site name and status of all available sites
  -h, --help                    Show help\n'
}

printSite() {
curl -s $EPG_SITESTAT
}

# While loop
channels_on=0
site_on=0
output_on=0
days_on=0
gzip_on=0

args=("$@")
while [ $# -ne 0 ]
do
	name="$1"
	case "$name" in
		-d|--dir)
			shift
			custom_dir="$1"
			;;
		-c|--channels)
			shift
			if [[ -z $1 ]] || [[ $1 == -* ]]; then break; fi
			EPG_CCH="$1"
			channels_on=1
			;;
		-s|--site)
			shift
			if [[ -z $1 ]] || [[ $1 == -* ]]; then break; fi
			EPG_SITE="$1"
			site_on=1
			;;
		-o|--output)
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
		-h|--help)
			helpMsg
			;;
		-ps|--printsites)
			printSite
			;;
		*)
			break
			;;
	esac
	shift
done

# Run script
checkReq
checkDir
updateEpg
