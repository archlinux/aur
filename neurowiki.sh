#!/bin/bash
export APP_DIR=/opt/neuroforest
export ENV=PRODUCTION
cd "$APP_DIR"
exec nenv/bin/invoke app.run
