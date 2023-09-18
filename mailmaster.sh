#!/bin/bash
export LIBRARY_PATH=$LIBRARY_PATH:/opt/mailmaster/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/mailmaster/lib/
cd /opt/mailmaster && ./mailmaster $@