#!/bin/sh
set -e

[ "$TELNETD_PEM_FILE" ] || TELNETD_PEM_FILE="/etc/telnetd-ssl/telnetd.pem"
[ "$TELNETD_CERT_NAME" ] || TELNETD_CERT_NAME="$(hostname -f)"
[ -e "$TELNETD_PEM_FILE.certbot" ] || exit 0

umask 0077
for name in $RENEWED_DOMAINS; do
	[ "$name" = "$TELNETD_CERT_NAME" ] || continue

	cert="$RENEWED_LINEAGE/fullchain.pem"
	pkey="$RENEWED_LINEAGE/privkey.pem"

	[ -f "$cert" ] && [ -f "$pkey" ] || continue

	mkdir -p "${TELNETD_PEM_FILE%/*}"
	cat "$pkey" "$cert" > "$TELNETD_PEM_FILE"
	chown _telnetd: "$TELNETD_PEM_FILE"
done
