#!/bin/bash

export NODE_VERSION=20.17 

source /usr/share/nvm/init-nvm.sh
nvm install $NODE_VERSION
node /opt/plexamp-headless/js/index.js
