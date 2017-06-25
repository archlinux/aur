#!/usr/bin/env bash
# Perform simple tests to ensure osmupdate works correctly.
set -euo pipefail

# Perform a sanity check. The output includes the current version.
osmupdate

# Create a (pointless) changefile. Vermont is sparse and geographically small.
wget 'http://download.geofabrik.de/north-america/us/vermont-latest.osm.pbf'
osmupdate vermont-latest.osm.pbf vermont-latest-updated.osm.pbf
