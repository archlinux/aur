#!/bin/sh

for i in "$@"; do
  case $i in
    --disable-tls-certificate-check)
      export NODE_TLS_REJECT_UNAUTHORIZED=0 # Allows for certificates which aren't in the system's store
      shift                                 # This decreases security and shouldn't be used regularly in untrusted networks.
      ;;
    --safe-mode)
      export TRILIUM_SAFE_MODE=1            # Enables some extra safety measures (i.e. disabling user scripting) to allow Trilium to load
      shift                                 # if something user-defined is causing it to crash
      ;;
    *)
      ;;
  esac
done    

export ELECTRON_IS_DEV=0 # Without this env variable Arch's Electron would open devtools by default

exec electron16 /usr/lib/trilium/app.asar $@
