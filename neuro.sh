#!/bin/bash
export APP_DIR=/opt/neuroforest
export ENV=PRODUCTION
exec /opt/neuroforest/nenv/bin/neuro "$@"
