#!/usr/bin/env bash

SCRIPT_NAME=$(basename "$0")
SCRIPT_PATH="/usr/share/neo4j/bin/$SCRIPT_NAME"

[ -r /etc/default/neo4j ] && . /etc/default/neo4j

NEO4J_HOME="${NEO4J_HOME:-/var/lib/neo4j}" NEO4J_CONF="${NEO4J_CONF:-/etc/neo4j}" exec "${SCRIPT_PATH}" "$@"
