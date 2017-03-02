#!/bin/bash
AURORA_HOME=/usr/lib/apache-aurora

# Flags controlling the JVM.
JAVA_OPTS=(
  -Xmx2g
  -Xms2g
  # GC tuning, etc.
)

# Flags controlling the scheduler.
AURORA_FLAGS=(
  # Port for client RPCs and the web UI
  -http_port=8081
  # Log configuration, etc.
)

# Environment variables controlling libmesos
export JAVA_HOME=...
export GLOG_v=1
# Port and public ip used to communicate with the Mesos master and for the replicated log
export LIBPROCESS_PORT=8083
export LIBPROCESS_IP=192.168.33.7
