#!/bin/bash

if [ -L /usr/bin/steam ]; then
  rm /usr/bin/steam
  mv /usr/lib/steam/steam /usr/bin/steam
else
  echo "There was a weird error (something didn't work correctly!) with uninstalling/reverting linux-steam-integration. If you can, please contact the author of the PKGBUILD (z3ntu) and tell him what you did with Steam/LSI. If something doesn't work correctly after removing this, reinstall the steam package."
fi
