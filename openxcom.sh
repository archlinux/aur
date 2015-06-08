#!/usr/bin/env bash

export LD_LIBRARY_PATH=/opt/yaml-cpp51/lib:$LD_LIBRARY_PATH
exec /usr/share/openxcom/common/openxcom $@
