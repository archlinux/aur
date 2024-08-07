#!/bin/sh

# This script is licensed under the GNU General Public License version 3 (or any later version, to your decision).
# The license text should be installed together with this software; otherwise it can be optained at https://www.gnu.org/licenses/gpl-3.0.en.html.

_rivendir='/usr/lib/riven-remake'
_rivenexecutable="${_rivendir}/Riven/Binaries/Win64/Riven-Win64-Shipping.exe"

_check_esync() {
  if [ `ulimit -Hn` -ge 524288 ]; then
    printf '%s\n' "System is Esync compatible."
    return 0
  else
    printf '%s\n' "System is NOT Esync compatible ('ulimit -Hn' is < 524288)."
    return 1
  fi
}

## TODO: Implement a proper test for FSYNC.
_check_fsync() {
  if true; then
    printf '%s\n' "System is blindly assumed to be Fsync compatible."
    return 0
  else
    printf '%s\n' "System is NOT Fsync compatible."
    return 1
  fi
}

if _check_esync; then
  export WINEESYNC=1
else
  export WINEESYNC=0
fi

if _check_fsync; then
  export WINEFSYNC=1
else
  export WINEFSYNC=0
fi

export WINE_DISABLE_FAST_SYNC=0


printf '%s\n' \
  "Launching Riven remake (2024) with wine ..." \
  "" \
  "You can consult this script, '$0', for information on how it is launched." \
  "" \
  "Enjoy Riven!" \
  ""

wine "${_rivenexecutable}" "$@"
