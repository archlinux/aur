#!/bin/sh

export CHROME_DESKTOP='org.ecosia.Browser.desktop'
export CHROME_VERSION_EXTRA='stable'
export CHROME_WRAPPER='/usr/bin/ecosiabrowser'

exec /opt/ecosia/chrome --ozone-platform-hint=auto "$@"
