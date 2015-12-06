#!/bin/bash
# Begin dhcpd-update-dns.sh

. /etc/dhcpd/dhcpd-update-samba-dns.conf || exit 1

ACTION=$1
IP=$2
HNAME=$3

export KRB5CC KEYTAB DOMAIN REALM PRINCIPAL NAMESERVER ZONE ACTION IP HNAME

/usr/bin/samba-dnsupdate.sh -m &

# End dhcpd-update-samba-dns.sh
