#!/bin/bash

MAX_MEMORY="${MAX_MEMORY:-1G}"

java -server -Xmx"${MAX_MEMORY}" -XX:+UnlockExperimentalVMOptions -XX:+HeapDumpOnOutOfMemoryError -XX:+OptimizeStringConcat -XX:+UseStringDeduplication -XX:+UseCompressedOops -XX:+UseNUMA -XX:+UseG1GC -jar JARFILE $@
