#!/bin/bash

set -e

extract_base="https://download1.graphhopper.com/public"
photon_version='PHOTON_DUMP_VERSION_SED'

if [ -z "$PHOTON_GRAPHHOPPER_REGION" ]; then
    echo "PHOTON_GRAPHHOPPER_REGION env variable not set."
    echo "Please enter one of the following graphhopper.com region identifiers:"
    echo "Regions: planet, africa, asia, australia-oceania, europe, north-america, south-america"
    echo "For regions other than planet you may also additionally set PHOTON_GRAPHHOPPER_COUNTRY."
    echo ""
    echo "For all available regions and countries see ${extract_base}"
    echo
    read -rp "Extract: " PHOTON_GRAPHHOPPER_REGION
    if [[ "$PHOTON_GRAPHHOPPER_REGION" != "planet" ]]; then
        read -rp "Country: " PHOTON_GRAPHHOPPER_COUNTRY
    fi
fi

if [[ -n "$PHOTON_GRAPHHOPPER_COUNTRY" ]] && ! [[ "$PHOTON_GRAPHHOPPER_COUNTRY" =~ ^([a-z]+[\-])?[a-z]+$ ]]; then
    echo "No valid \$PHOTON_GRAPHHOPPER_COUNTRY set, exiting" 1>&2
    exit 2
fi

echo "Removing old $(pwd)/photon_data"
rm -Rf "./photon_data"

# Note: 'experimental' just referes to the OpenSearch extracts, which are recommended by photon

if [ "${PHOTON_GRAPHHOPPER_REGION}" = "planet" ]; then
    # https://download1.graphhopper.com/public/photon-db-planet-1.0-latest.tar.bz2
    extract_url="${extract_base}/photon-db-planet-${photon_version}-latest.tar.bz2"
elif [[ -n "$PHOTON_GRAPHHOPPER_COUNTRY" ]]; then
    # https://download1.graphhopper.com/public/europe/germany/photon-db-germany-1.0-latest.tar.bz2
    extract_url="${extract_base}/${PHOTON_GRAPHHOPPER_REGION}/${PHOTON_GRAPHHOPPER_COUNTRY}/photon-db-${PHOTON_GRAPHHOPPER_COUNTRY}-1.0-latest.tar.bz2"
else
    # https://download1.graphhopper.com/public/europe/photon-db-europe-1.0-latest.tar.bz2
    extract_url="${extract_base}/${PHOTON_GRAPHHOPPER_REGION}/photon-db-${PHOTON_GRAPHHOPPER_REGION}-${photon_version}-latest.tar.bz2"
fi

echo "Downloading '${extract_url}' to '$(pwd)/photon_data' …"

curl -s "$extract_url" | tar -xjf - -C ./
