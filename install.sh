#!/bin/sh
cd /var/lib/flood && \
    cp /etc/default/flood.js config.js && \
    npm install && \
    npm run build
