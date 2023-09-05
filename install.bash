#!/bin/bash

pre_install() {
  # old versions of the script generated and installed
  # the hook, now it is part of this package, so we
  # remove the old hook, to avoid duplicates.
  [[ -f /usr/share/libalpm/hooks/vivaldi-UI-js.hook ]] \
    && rm /usr/share/libalpm/hooks/vivaldi-UI-js.hook
}
