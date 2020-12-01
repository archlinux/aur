#!/bin/bash
# Get transmission credentials, if set
if [[ -n "$TRANSMISSION_USER" && -n "$TRANSMISSION_PASS" ]]; then
    auth="${TRANSMISSION_USER:-user}:${TRANSMISSION_PASS:-password}"
else
    auth=
fi
host=${TRANSMISSION_HOST:-localhost}
list_url=${TRACKER_URL:-https://trackerslist.com/best.txt}

add_trackers () {
    torrent_hash=$1
 for base_url in "${list_url}" ; do
    echo -e "\e[1m\e[5m"
    echo "URL for ${base_url}"
    echo -e "Adding trackers for \e[91m$torrent_name..."
    echo -en "\e[0m"
    echo -e "\e[2m\e[92m"
for tracker in $(curl --location -# "${base_url}") ; do
    echo -en "\e[0m"
    echo -ne "\e[93m*\e[0m ${tracker}..."
if transmission-remote "$host" ${auth:+--auth="$auth"} --torrent "${torrent_hash}" -td "${tracker}" | grep -q 'success'; then
    echo -e '\e[92m done.'
    echo -en "\e[0m"
else
    echo -e '\e[93m already added.'
    echo -en "\e[0m"
fi
 done
done
}

# Get list of active torrents
ids=${1:-"$(transmission-remote "$host" ${auth:+--auth="$auth"} --list | grep -vE 'Seeding|Stopped|Finished' | grep '^ ' | awk '{ print $1 }')"}

for id in $ids ; do
    hash="$(transmission-remote "$host" ${auth:+--auth="$auth"}  --torrent "$id" --info | grep '^  Hash: ' | awk '{ print $2 }')"
    torrent_name="$(transmission-remote "$host" ${auth:+--auth="$auth"}  --torrent "$id" --info | grep '^  Name: ' |cut -c 9-)"
    add_trackers "$hash"
done
