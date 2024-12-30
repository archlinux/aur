#!/bin/sh
LOBE_DIR="/usr/share/lobe-chat/"
NVM_DIR="/usr/share/lobe-chat/.nvm"
source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
cd ${LOBE_DIR}
nvm install
nvm use
node server.js
