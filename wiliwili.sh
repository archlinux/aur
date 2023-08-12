#!/bin/env bash
#
# org.freedesktop.appearance color-scheme
#
# Indicates the system's preferred color scheme.
# Supported values are:
#
#   0: No preference
#   1: Prefer dark appearance
#   2: Prefer light appearance
#
# Unknown values should be treated as 0 (no preference).

wiliwili_path=/usr/share/wiliwili/wiliwili

scheme=$(
  gdbus call --session --timeout=1000 \
             --dest=org.freedesktop.portal.Desktop \
             --object-path /org/freedesktop/portal/desktop \
             --method org.freedesktop.portal.Settings.Read org.freedesktop.appearance color-scheme
)

wiliwili_boot_dark () {
	BOREALIS_THEME=DARK $wiliwili_path
}

wiliwili_boot_light () {
	BOREALIS_THEME=LIGHT $wiliwili_path
}

wiliwili_boot_default () {
	wiliwili_boot_light
}

case $scheme in
  ( '(<<uint32 1>>,)' ) wiliwili_boot_dark;;
  ( '(<<uint32 2>>,)' ) wiliwili_boot_light;;
  ( *                 ) wiliwili_boot_default;;
esac
