#!/bin/sh

# Downloads updated AWS pricing data

update_prices() {
    local BASE_URL="https://oiq.terrateam.io"
    local PRICES_FILENAME="prices.csv.gz"
    local DEST_DIR="/opt/openinfraquote"

    curl -sL "${BASE_URL}/${PRICES_FILENAME}" | gunzip > "${DEST_DIR}/prices.csv"

    return $?
}

update_prices
exit $?
