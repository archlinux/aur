#!/bin/bash

USER=${1:-none}
REG=${2:-no}
URL=${3:-http://localhost:8090}
RUNAS=${RUNAS:-synapse}

if [[ "${USER}" = "none" ]] || [[ "${USER}" = "" ]] ||\
   [[ "${USER}" = "--register" ]] || [[ "${USER}" = "--help" ]] ||\
   [[ "${REG}" = "--help" ]] || [[ "${URL}" = "--help" ]]; then
    echo 'USER required'
    echo ''
	echo "usage $0 USER [--register [URL]]"
	echo '--register - generates registation-USER.yaml file. Must edit config json first!!'
	echo '             URL tells synapse how to reach the puppet daemon.'
	echo '             defaults to http://localhost:8090'
	echo ''
	echo 'If only USER is provided:'
	echo '  Sets up some folders/symlinks to make up for a lack of configurability'
	echo '  in matrix-puppet-hangouts. After running this script, edit '
	echo '     /etc/synapse/matrix-puppet-hangouts/config-USER.json'
	echo '  Log into hangups and place the token in '
	echo '     /etc/synapse/matrix-puppet-hangouts/refresh_token-USER.txt'
	echo '  And place registration in'
	echo '     /etc/synapse/matrix-puppet-hangouts/registration-USER.yaml'
	echo '  Note that the registration path also goes in config-USER.json'
	exit 1
fi

if [[ ${REG} = "--register" ]]; then
echo "Registering a puppet on ${URL}"
sudo chown ${RUNAS}:${RUNAS} /etc/synapse/matrix-puppet-hangouts/config-${USER}.json
sudo chmod u+rw /etc/synapse/matrix-puppet-hangouts/config-${USER}.json
sudo -u ${RUNAS} HOME=/var/lib/matrix-puppet-hangouts/${USER}/ \
	node /usr/lib/node_modules/matrix-puppet-hangouts/index.js -r -u "${URL}"
sudo chown root:root /etc/synapse/matrix-puppet-hangouts/config-${USER}.json
else

echo Running initial setup
#Real conf files should be in /etc
#Real databases in /var/lib
#Goofy fake home folder in /var/lib, but only containing simlinks
sudo -u ${RUNAS} mkdir -p /var/lib/matrix-puppet-hangouts/${USER}/.cache/hangups/
sudo touch /etc/synapse/matrix-puppet-hangouts/registration-${USER}.yaml
sudo chown ${RUNAS}:${RUNAS} /etc/synapse/matrix-puppet-hangouts/registration-${USER}.yaml
sudo ln -s /etc/synapse/matrix-puppet-hangouts/refresh_token-${USER}.txt /var/lib/matrix-puppet-hangouts/${USER}/.cache/hangups/refresh_token.txt
sudo ln -s /etc/synapse/matrix-puppet-hangouts/config-${USER}.json /var/lib/matrix-puppet-hangouts/${USER}/config.json
if [[ ! -e /etc/synapse/matrix-puppet-hangouts/config-${USER}.json ]]; then
	sudo cp /etc/synapse/matrix-puppet-hangouts/config{.sample,-${USER}}.json
fi
sudo touch /etc/synapse/matrix-puppet-hangouts/refresh_token-${USER}.txt
sudo chown ${RUNAS}:${RUNAS} /etc/synapse/matrix-puppet-hangouts/{config-${USER}.json,refresh_token-${USER}.txt}
sudo -u ${RUNAS} chmod 600 /etc/synapse/matrix-puppet-hangouts/refresh_token-${USER}.txt

sudo -u ${RUNAS} touch /var/lib/matrix-puppet-hangouts/{user,room}-store-${USER}.db
sudo -u ${RUNAS} chmod 600 /var/lib/matrix-puppet-hangouts/{user,room}-store-${USER}.db
sudo ln -s /var/lib/matrix-puppet-hangouts/room-store-${USER}.db /var/lib/matrix-puppet-hangouts/${USER}/room-store.db
sudo ln -s /var/lib/matrix-puppet-hangouts/user-store-${USER}.db /var/lib/matrix-puppet-hangouts/${USER}/user-store.db
sudo ln -s /usr/lib/node_modules/matrix-puppet-hangouts/hangups_client.py /var/lib/matrix-puppet-hangouts/${USER}/
echo 'Now edit the config json file, then run setup with --register'
fi
