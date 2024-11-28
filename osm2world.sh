#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Change to the OSM2World directory
cd /opt/osm2world

# Default VM parameters
vmparams="-Xmx2G"

# Parse optional --vm-params argument
if [[ $1 == --vm-params=* ]]; then
    vmparams="${1#--vm-params=}"
    shift
fi

# Check if the JAR file exists
if [[ ! -f OSM2World.jar ]]; then
    echo "Error: OSM2World.jar not found in /opt/osm2world."
    exit 1
fi

# Run the Java application
exec java $vmparams -jar OSM2World.jar "$@"
