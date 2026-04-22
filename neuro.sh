#!/bin/bash
export APP_DIR=/opt/neuroforest
export ENVIRONMENT=PRODUCTION
exec /opt/neuroforest/nenv/bin/neuro "$@"
