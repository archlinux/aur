#!/bin/sh
# Under the system Electron the shell is not "packaged", so it would look for
# its kernel and SPA beside its sources instead of in process.resourcesPath.
# Point it at the installed copies through upstream's own overrides.
export REASONIX_STUDIO_HOST="${REASONIX_STUDIO_HOST:-/usr/lib/reasonix-studio/bin/reasonix-studio-host}"
export REASONIX_STUDIO_PAGE="${REASONIX_STUDIO_PAGE:-/usr/lib/reasonix-studio/frontend-next/dist}"
# Launch the app directory so app.getVersion() reads its package.json.
exec @ELECTRON@ /usr/lib/reasonix-studio/app "$@"
