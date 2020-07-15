#!/bin/sh -e

# This program is not affiliated with DuckDNS.

# duckdns.sh - automatically update DuckDNS domains (with IPv6 support)
# Copyright (C) 2020  Nitroretro
# Copyright (C) 2020  NixUnderflow
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Arguments: PATH
basename() {
	name=${1%${1##*[!/]}}
	name=${name##*/}
	printf "%s\n" "${name:-"/"}"
}

# Arguments: TEXT
url_encode() {
	jq --null-input --raw-output --arg value "$1" '$value | @uri'
}

# Arguments:
# * MESSAGE
# * PRIORITY = "info": see logger(1) -> FACILITIES AND LEVELS
log() {
	[ -n "$configuration_name" ] && message="${configuration_name}: $1" || message="$1"
	[ "$2" = "err" ] && exit_code=1
	logger --tag DuckDNS --priority "daemon.${2:-"info"}" "$message"
}

# Arguments: CURL_FAMILY, ADDRESS, URL, AUTO
determine_address() {
	[ -n "$2" ] && echo "$2" && return
	if [ -n "$3" ]; then
		address="$(curl --silent "$1" "$3")" && echo "$address" && return
		log "$1: Failed to get address via URL." err
	fi
	[ "$4" = 1 ] && echo "" && return
}

update() {
	[ "$(curl --silent "$1")" = "KO" ] && log "Failed to update." err
	sent_update=1
}

main() {
	exit_code=0

	for configuration_file in /etc/duckdns.d/*; do
		unset -v DOMAINS TOKEN IPV4_ADDRESS IPV4_URL IPV4_AUTO IPV6_ADDRESS IPV6_URL
		sent_update=0
		# shellcheck source=duckdns.conf
		. "$configuration_file"
		configuration_name="$(basename "$configuration_file")"

		[ -z "$DOMAINS" ] && log "DOMAINS is required." err && continue
		[ -z "$TOKEN" ] && log "TOKEN is required." err && continue

		log "Getting addresses..."
		ipv4="$(url_encode "$(determine_address --ipv4 "$IPV4_ADDRESS" "$IPV4_URL" "$IPV4_AUTO")")"
		ipv6="$(url_encode "$(determine_address --ipv6 "$IPV6_ADDRESS" "$IPV6_URL")")"

		log "Updating addresses..."
		initial_update_url="https://www.duckdns.org/update?domains=$(url_encode "$DOMAINS")&token=$(url_encode "$TOKEN")"
		update_url="$initial_update_url"
		[ -z "$ipv4" ] && [ "$IPV4_AUTO" = 1 ] && update "${update_url}&ip=${ipv4}"
		[ -n "$ipv4" ] && update_url="${update_url}&ip=${ipv4}"
		[ -n "$ipv6" ] && update_url="${update_url}&ipv6=${ipv6}"
		[ "$update_url" != "$initial_update_url" ] && update "$update_url"
		[ "$sent_update" = 0 ] && log "There is no IPv4 or IPv6 address to update." err
	done
	unset -v configuration_name

	log "Done updating addresses."
	exit "$exit_code"
}

main "$@"
