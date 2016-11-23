#!/bin/sh

logger -t DuckDNS "Updating DuckDNS entries"
EXITCODE=0
for file in /etc/duckdns.d/*.cfg
do
	source "${file}"
	logger -t DuckDNS "Executing config file '${file}'"
	OUTPUT=$(curl -k -s "https://www.duckdns.org/update?domains=${duckdns_hostname}&token=${duckdns_token}&ip=")
	logger -t DuckDNS ${OUTPUT}
	if [ "${OUTPUT}" == "KO" ]; then
		logger -t DuckDNS "You should check if your domain/token is correct because the server responded negatively!"
		EXITCODE=1
	fi
done

exit $EXITCODE
