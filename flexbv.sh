#!/bin/sh

FLEXBV_LOAD=$(realpath "$@")
mkdir -p "${HOME}/.config/FlexBV"
cd "${HOME}/.config/FlexBV"
/opt/flexbv/flexbv "${FLEXBV_LOAD}"
