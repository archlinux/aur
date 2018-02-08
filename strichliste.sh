#!/bin/sh

# Create or migrate database
/usr/bin/node /usr/lib/node_modules/strichliste/createDatabase.js

# Start strichliste backend
/usr/bin/node /usr/lib/node_modules/strichliste/server.js --externalconfig=/etc/strichliste.js "$@"
