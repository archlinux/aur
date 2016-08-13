#!/usr/bin/env bash

BASE_DIR=/usr/share/rocketchat-server
CONFIG_FILE=/etc/rocketchat/rocketchat-server.conf
NVM_SCRIPT=/usr/share/nvm/init-nvm.sh
NODE_VERSION=0.10.46

errorout() { echo "$@" && exit 1; }

# Read rocketchat configuration.
[[ ! -r "${CONFIG_FILE}" ]] && errorout "Could not read ${CONFIG_FILE}!"
echo "Reading configuration from ${CONFIG_FILE}"
# Automatically export variables from CONFIG_FILE.
set -a
. "${CONFIG_FILE}"
set +a
[[ -z "${ROOT_URL}" ]] && errorout "No ROOT_URL found in ${CONFIG_FILE}!"

# Prepare node environment.
echo "Sourcing nvm script at ${NVM_SCRIPT}"
source "${NVM_SCRIPT}"
echo "Installing nodejs version ${NODE_VERSION} via nvm."
nvm install "${NODE_VERSION}"
nvm use "${NODE_VERSION}"

# Install dependencies.
cd "${BASE_DIR}/programs/server"
echo "Installing rocketchat npm dependencies."
npm install

# Run the rocketchat server.
echo "Starting rocketchat..."
node "${BASE_DIR}/main.js"
