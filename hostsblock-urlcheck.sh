#!/bin/bash
# DO NOT MODIFY THIS FILE. MODIFY SETTINGS VIA THE CONFIGURATION FILES IN
# /etc/hostsblock.conf

# GET OPTIONS
while getopts "v:f:h" _option; do
    case "$_option" in
        f)  [ "$OPTARG" != "" ] && _configfile="$OPTARG";;
        *)
            cat << EOF
Usage:
  $0 [ -f CONFIGFILE ] URL  - Check if URL and other urls contained therein are blocked

$0 will first verify that [url] is blocked or unblocked,
and then scan that url for further contained subdomains

Help Options:
  -h                            Show help options

Application Options:
  -f CONFIGFILE                 Specify an alternative configuration file (instead of /etc/hostsblock/hostsblock.conf)
EOF
            exit 1
        ;;
    esac
done

# SOURCE DEFAULT SETTINGS AND SUBROUTINES
if [ -f /usr/lib/hostsblock-common.sh ]; then
    source /usr/lib/hostsblock-common.sh
elif [ -f /usr/local/lib/hostsblock-common.sh ]; then
    source /usr/local/lib/hostsblock-common.sh
elif [ -f ./hostsblock-common.sh ]; then
    source ./hostsblock-common.sh
else
    echo "hostsblock.common.sh NOT FOUND. INSTALL IT TO /usr/lib/ OR /usr/local/lib/. EXITING..."
    exit 1
fi

_check_root
_check_depends curl grep sed tr
_source_configfile
_verbosity_check
_set_subprocess_verbosity

# MAIN ROUTINE
_changed=0
echo "Checking to see if url is blocked or unblocked..."
_check_url $(echo "$@" | sed -e "s/.*https*:\/\///g" -e "s/[\/?'\" :<>\(\)].*//g")
if [ $_changed == 1 ]; then
    if [ $verbosity -ge 5 ]; then
        postprocess
    else
        postprocess &>/dev/null
    fi
fi
read -p "Page domain verified. Scan the whole page for other domains for (un)blocking? [y/N] " a
if [[ $a == "y" || $a == "Y" ]]; then
    for LINE in `curl -L --location-trusted -s "$@" | tr ' ' '\n' | grep "https*:\/\/" | sed -e "s/.*https*:\/\/\(.*\)$/\1/g" -e "s/\//\n/g" | grep "\." |\
      grep -v "\"" | grep -v ")" | grep -v "(" | grep -v "\&" | grep -v "\?" | grep -v "<" | grep -v ">" | grep -v "'" | grep -v "_" |\
      grep -v "\.php$" | grep -v "\.html*$" | grep "[a-z]$" | sort -u | tr "\n" " "`; do
        _check_url "$LINE"
    done
    echo "Whole-page scan completed."
fi

if [ $_changed == 1 ]; then
    if [ $verbosity -ge 5 ]; then
        postprocess
    else
        postprocess &>/dev/null
    fi
fi
