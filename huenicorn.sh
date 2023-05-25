#!/bin/bash
pushd . > /dev/null
cd /opt/huenicorn
./huenicorn "$@"
popd > /dev/null
