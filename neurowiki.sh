#!/bin/bash
export NF_DIR=/opt/neuroforest
export NF_MODE=system
export ENVIRONMENT=PRODUCTION
cd "$NF_DIR"
exec nenv/bin/invoke app.run
