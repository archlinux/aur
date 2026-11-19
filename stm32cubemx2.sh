#!/bin/sh

_app_root=/opt/stm32cubemx2
_dist="${_app_root}/resources/stm32cubemx-application/@PKGVER@/dist"

export PATH="${_app_root}/.bin:${PATH}"
export CUBE_BUNDLE_PATH="${_app_root}/resources/stm32cubemx-application/@PKGVER@/bundles"
export CUBE_BUNDLE_PATH_EXTRA="${CUBE_BUNDLE_PATH_EXTRA:-${XDG_DATA_HOME:-$HOME/.local/share}/stm32cube/bundles}"
export CMSIS_PACK_ROOT="${CMSIS_PACK_ROOT:-${XDG_CACHE_HOME:-$HOME/.cache}/arm/packs}"

cd "${_dist}" || exit 1
exec electron44 resources/app "$@"
