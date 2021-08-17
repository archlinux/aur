#!/bin/sh
HERE="$(dirname "$(readlink -f "${0}")")"
exec "${HERE}"/netease-cloud-music $@
