#!/bin/sh

if [[ ! -e data.sqlite ]]; then
	echo "Creating new strichliste database..."
	/usr/bin/node /usr/lib/node_modules/strichliste/createDatabase.js
fi

/usr/bin/node /usr/lib/node_modules/strichliste/server.js --externalconfig=/etc/strichliste.js
