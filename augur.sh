#!/bin/sh 
export NODE_ENV=production
electron /usr/lib/augur/resources/app.asar $@
