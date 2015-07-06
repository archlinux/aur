#!/bin/bash
basename=$(basename $0)
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/ibm/gsk8_64/lib64:/opt/tivoli/tsm/client/api/bin64 /opt/tivoli/tsm/client/ba/bin/$basename $@
