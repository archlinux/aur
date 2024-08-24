#!/bin/bash

MAX_MEMORY="$(($(free --mega | grep Mem: | xargs | cut -d' ' -f7) - 1000))"

java -server -Xmx${MAX_MEMORY}M -XX:+UnlockExperimentalVMOptions -XX:+HeapDumpOnOutOfMemoryError -XX:+OptimizeStringConcat -XX:+UseStringDeduplication -XX:+UseCompressedOops -XX:+UseNUMA -XX:+UseG1GC -jar PIPEDBACKENDPATH $@
