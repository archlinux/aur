#!/bin/sh
if [ $1 ]; then
    export NYA_LCF_FRPC_PATH=$1
else
    export NYA_LCF_FRPC_PATH='/usr/bin/frpc'
fi

/usr/share/nyanana/nyanana
