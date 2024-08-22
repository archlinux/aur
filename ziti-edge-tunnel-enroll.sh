#!/usr/bin/env sh
#
# ziti-edge-tunnel-enroll.sh
#
# enroll all identity tokens found in ZITI_IDENTITY_DIR

set -eu

for JWT in ${ZITI_IDENTITY_DIR}/*.jwt; do
    # handle case where JWT='/opt/openziti/etc/identities/*.jwt'
    [ -e "${JWT}" ] || {
        echo "NOTICE: no new JWT files in ${JWT}" >&2
        continue
    }
    [ -r "${JWT}" ] || {
        echo "WARN: skipping unreadable JWT file in ${JWT}" >&2
        continue
    }
    [ -s "${JWT}" ] || {
        echo "WARN: skipping empty JWT file in ${JWT}" >&2
        continue
    }
    # equivalent to BASH's ${JWT%.jwt}.json
    CONFIG="$(echo "${JWT}" | sed -E 's|(.*).jwt|\1.json|')"
    if ziti-edge-tunnel enroll --jwt ${JWT} --identity ${CONFIG}; then
        rm --force "${JWT}"
        echo "INFO: enrolled $(basename "${JWT}") in ${CONFIG}"
    else
        echo "ERROR: failed to enroll $(basename "${JWT}") in $(dirname "${JWT}")" >&2
        exit 1
    fi
done
