#!/bin/sh
# First arg is log level, e.g. -d for DEBUG

# As explained on : https://github.com/pytrainer/pytrainer/issues/158#issuecomment-448475330
# The reason for the non working OSM in pytrainer is, that openlayers.org / cloudfare is sending:
#`Access denied | openlayers.org used Cloudflare to restrict access`
#when using the default user-agent of the python urllib. Changing user-agent to pytrainer solves it:
wget -q -O ${HOME}/.pytrainer/tmp/cache/OpenLayers.js http://www.openlayers.org/api/OpenLayers.js


cd /usr/share/pytrainer
exec python2 pytrainer "$@"
