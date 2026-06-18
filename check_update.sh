#!/usr/bin/env bash

set -euo pipefail

pkgbuild_path="PKGBUILD"
latest_url="https://dl.lazycatmicroserver.com/hclient-cli/latest-version.json"

if ! command -v curl >/dev/null 2>&1; then
    echo "error: curl is required" >&2
    exit 2
fi

if [[ ! -f "${pkgbuild_path}" ]]; then
    echo "error: PKGBUILD not found: ${pkgbuild_path}" >&2
    exit 2
fi

extract_pkgbuild_scalar() {
    local key=$1
    sed -nE "s/^${key}=([^[:space:]]+)$/\1/p" "${pkgbuild_path}" | head -n1
}

current_version=$(extract_pkgbuild_scalar "pkgver")

latest_json=$(curl -fsSL "${latest_url}")
latest_version=$(sed -nE 's/.*"version"[[:space:]]*:[[:space:]]*"v?([^"]+)".*/\1/p' <<<"${latest_json}" | head -n1)

if [[ -z "${current_version}" ]]; then
    echo "error: failed to parse local PKGBUILD" >&2
    exit 2
fi

if [[ -z "${latest_version}" ]]; then
    echo "error: failed to parse ${latest_url}" >&2
    exit 2
fi

if [[ "${current_version}" != "${latest_version}" ]]; then
    echo "update required"
    echo "local:  version=${current_version}"
    echo "remote: version=${latest_version}"
    exit 10
fi

echo "PKGBUILD is up to date (${current_version})"
