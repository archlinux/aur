#!/bin/bash

daemon_name=k10ctl
. /etc/conf.d/$daemon_name

let CORES=CORES-1

	if ${CONFIGURATED}; then
	  for i in ${PSTATES[@]}; do
      		$daemon_name 0-${CORES} $i -nv ${NBVID[$i]} -cv ${CPUVID[$i]} -cd ${DID[$i]} -cf ${FID[$i]}
	  done
      if [ $? -gt 0 ]; then
        exit 1
      fi
	else
		exit 1
	fi

exit 0
