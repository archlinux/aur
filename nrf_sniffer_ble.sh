#!/bin/sh

pkgroot="/usr/lib/nrf-sniffer-ble"
export PYTHONPATH="${pkgroot}/pymodule:${PYTHONPATH}"

exec /usr/bin/python ${pkgroot}/extcap/nrf_sniffer_ble.py "$@"
