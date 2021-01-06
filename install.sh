#!/usr/bin/env sh

post_install() {
    echo "! decK collects anonymized analytics by default"
    echo "! It can be disabled by setting the environment variable DECK_ANALYTICS to off"
    echo "! For more information, see https://docs.konghq.com/deck/commands/"
}

post_upgrade() {
    post_install
}
