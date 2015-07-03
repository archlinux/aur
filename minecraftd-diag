#!/bin/bash

. /etc/conf.d/minecraft || echo "can't source /etc/conf.d/minecraft"

cd $_SRVDIR
echo "If the next command executes correctly, then something is wrong with screen."
su minecraft -c "PATH=/opt/java/bin/:/usr/bin/:$PATH java -Xmx${MAXHEAP} -Xms${MINHEAP} -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=${THREADS} -XX:+AggressiveOpts -jar ${_SRVDIR}/${SERVERJAR} nogui"
