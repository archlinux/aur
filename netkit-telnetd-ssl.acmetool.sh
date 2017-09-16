#!/bin/sh
set -e

EVENT_NAME="$1"
[ "$EVENT_NAME" = "live-updated" ] || exit 42

[ "$ACME_STATE_DIR" ] || ACME_STATE_DIR="/var/lib/acme"
[ "$TELNETD_PEM_FILE" ] || TELNETD_PEM_FILE="/etc/telnetd-ssl/telnetd.pem"
[ "$TELNETD_CERT_NAME" ] || TELNETD_CERT_NAME="$(hostname -f)"

[ -e "${TELNETD_PEM_FILE}.acmetool" ] || exit 0

umask 0077
while read name; do
	[ "$name" = "$TELNETD_CERT_NAME" ] || continue

	cert="$ACME_STATE_DIR/live/$name/fullchain"
	pkey="$ACME_STATE_DIR/live/$name/privkey"

	[ -f "$cert" ] && [ -f "$pkey" ] || continue

	mkdir -p "${TELNETD_PEM_FILE%/*}"
	cat "$pkey" "$cert" > "$TELNETD_PEM_FILE"
	chown _telnetd: "$TELNETD_PEM_FILE"
done
