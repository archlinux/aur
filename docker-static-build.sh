#! /usr/bin/env bash

# SPDX-FileCopyrightText: 2020 TQ Tezos <https://tqtezos.com/>
#
# SPDX-License-Identifier: LicenseRef-MIT-TQ

# This script builds static tezos-binaries using custom alpine image.
# It expects docker or podman to be installed and configured.

set -euo pipefail

binaries=("tezos-admin-client" "tezos-client" "tezos-node" "tezos-signer" "tezos-codec" "tezos-sandbox")
zcash_params=("sapling-output.params" "sapling-spend.params")

for proto in $(jq -r ".active | .[]" protocols.json); do
    binaries+=("tezos-accuser-$proto" "tezos-baker-$proto" "tezos-endorser-$proto")
done

if [[ "${USE_PODMAN-}" == "True" ]]; then
    virtualisation_engine="podman"
else
    virtualisation_engine="docker"
fi

arch="host"

if [[ -n "${1-}" ]]; then
    arch="$1"
fi

if [[ $arch == "host" ]]; then
    docker_file=build/Dockerfile
elif [[ $arch == "aarch64" ]]; then
    docker_file=build/Dockerfile.aarch64
else
    echo "Unsupported architecture: $arch"
    echo "Only 'host' and 'aarch64' are currently supported"
    exit 1
fi

if [[ $arch == "aarch64" && $(uname -m) != "x86_64" ]]; then
    echo "Compiling for aarch64 is supported only from aarch64 and x86_64"
fi

"$virtualisation_engine" build -t alpine-tezos -f "$docker_file" --build-arg TEZOS_VERSION="$TEZOS_VERSION" .
container_id="$("$virtualisation_engine" create alpine-tezos)"
for b in "${binaries[@]}"; do
    "$virtualisation_engine" cp "$container_id:/tezos/$b" "$b"
done
for p in "${zcash_params[@]}"; do
    "$virtualisation_engine" cp "$container_id:/tezos/_opam/share/zcash-params/$p" "$p"
done
"$virtualisation_engine" rm -v "$container_id"
