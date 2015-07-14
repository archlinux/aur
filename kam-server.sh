#!/bin/sh

cd /usr/share/knightsandmerchants-remake-server/

MACHINE_TYPE=$(uname -m)
if [ ${MACHINE_TYPE} == 'i686' ]; then
./KaM_Remake_Server_x86
else
./KaM_Remake_Server_x86_64
fi
