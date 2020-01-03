#!/bin/sh

failed=0

log() {
	[ "$1" = "err" ] && failed=1
	[ -n "$config_name" ] && message="$config_name: $2" || message="$2"
	logger -t DuckDNS -p "daemon.$1" "$message"
}

url_encode() {
	jq --null-input --raw-output --arg input "$1" '$input | @uri'
}

log info "Updating the DuckDNS domains..."
for config_file in /etc/duckdns.d/*; do
	unset -v DOMAINS TOKEN IPV4_URL IPV4_ADDRESS IPV6_URL IPV6_ADDRESS
	config_name=$(basename "$config_file")
	. "$config_file"

	[ -z "$DOMAINS" ] && log err "DOMAINS is not set." && continue
	[ -z "$TOKEN" ] && log err "TOKEN is not set." && continue

	query_url="https://www.duckdns.org/update?domains=$(url_encode "$DOMAINS")&token=$(url_encode "$TOKEN")"

	if [ -n "$IPV6_ADDRESS" ]; then
		ipv6="$IPV6_ADDRESS"
	elif [ -n "$IPV6_URL" ]; then
		if ! ipv6=$(curl -s "$IPV6_URL"); then
			log err "Failed to get the IPV6 address using IPV6_URL. Unable to update the IPv6 address."
			unset -v ipv6
		fi
	fi
	[ -n "$ipv6" ] && query_url="${query_url}&ipv6=$(url_encode "$ipv6")"

	if [ -n "$IPV4_ADDRESS" ]; then
		ipv4="$IPV4_ADDRESS"
	elif [ -n "$IPV4_URL" ]; then
		if ! ipv4=$(curl -s "$IPV4_URL"); then
			if [ -z "$ipv6" ]; then
				log warn "Failed to get the IPv4 address using IPV4_URL. Falling back to DuckDNS' automatic address detection."
			else
				# DuckDNS doesn't try to automatically detect the IPv4 address if you also specify an IPv6 address.
				log warn "Failed to get the IPv4 address using IPV4_URL. Unable to update the IPv4 address."
			fi
			unset -v ipv4
		fi
	fi
	[ -n "$ipv4" ] && query_url="${query_url}&ip=$(url_encode "$ipv4")"

	if [ "$(curl -s "$query_url")" = "OK" ]; then
		log info "Successfully updated the DuckDNS domains."
	else
		log err "Failed to update the DuckDNS domains."
	fi
done
unset -v config_name
log info "Finished updating the DuckDNS domains."

exit "$failed"
