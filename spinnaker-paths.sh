#!/bin/sh
if [ -d /opt/spinnaker/bin ]; then
    if [[ $PATH != *"/opt/spinnaker/bin"* ]]; then
        export PATH=/opt/spinnaker/bin:$PATH
    fi
fi
