#!/bin/bash
if [[ -d /opt/skywire/local ]]; then
  rm -rf /opt/skywire/local
fi
if [[ -f /opt/skywire/skywire.json ]] ; then
  rm -rf /opt/skywire/*.json
fi
if [[ -f /opt/skywire/users.db ]] ; then
  rm -rf /opt/skywire/users.db
fi
