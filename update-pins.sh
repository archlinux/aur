#!/usr/bin/env bash
# Write the upstream pins for the pkgver in PKGBUILD into PKGBUILD, read from
# Strata's source at the release tag:
#
#   _harness_commit                  apps/host/server/agent/README.md, which must
#                                    agree with apps/host/server/agent/preset.mjs
#   _pbs_release, _python_version,   packaging/package_terminal.py
#   _pbs_sha256                      (PBS_RELEASE, PYTHON_VERSION, PYTHON_PINS)
#   _node_version, _node_sha256      apps/desktop/scripts/fetch-node.sh
#
# Needs curl.
set -euo pipefail

cd "$(dirname "$0")"
for cmd in curl; do
    command -v "$cmd" >/dev/null || { echo "update-pins: $cmd is required" >&2; exit 1; }
done

pkgver=$(awk -F= '/^pkgver=/ { print $2 }' PKGBUILD)
repo=Niko1221/Strata
tag="v${pkgver}"

echo "==> Reading the pins of Strata ${tag}"

upstream() { curl -fsSL "https://raw.githubusercontent.com/${repo}/${tag}/$1"; }

# the harness pin is only written down in prose, in two places: require both,
# and require them to agree, so a stale one stops the update instead of being used
readme_pin=$(upstream apps/host/server/agent/README.md | sed -n 's/.*pinned component.*commit `\([0-9a-f]\{7,40\}\)`.*/\1/p' | head -n1)
preset_pin=$(upstream apps/host/server/agent/preset.mjs | sed -n 's/.*preset (pinned \([0-9a-f]\{7,40\}\).*/\1/p' | head -n1)
if [ -z "$readme_pin" ] || [ -z "$preset_pin" ]; then
    echo "update-pins: harness pin not found (README.md: '${readme_pin}', preset.mjs: '${preset_pin}')" >&2
    exit 1
fi
case "$readme_pin" in "$preset_pin"*) ;; *)
    case "$preset_pin" in "$readme_pin"*) ;; *)
        echo "update-pins: harness pins disagree (README.md ${readme_pin}, preset.mjs ${preset_pin})" >&2
        exit 1 ;;
    esac ;;
esac
# this media type makes the API answer with the bare full SHA
harness_commit=$(curl -fsSL -H 'Accept: application/vnd.github.sha' \
    "https://api.github.com/repos/deepseek-ai/deepseek-harness/commits/${readme_pin}")

package_terminal=$(upstream packaging/package_terminal.py)
pbs_release=$(sed -n 's/^PBS_RELEASE = "\([0-9]*\)"$/\1/p' <<<"$package_terminal")
python_version=$(sed -n 's/^PYTHON_VERSION = "\([0-9.]*\)"$/\1/p' <<<"$package_terminal")
# the sha256 line inside the "linux-x86_64": { ... } entry of PYTHON_PINS
pbs_sha256=$(sed -n '/^ *"linux-x86_64": {/,/^ *},/ s/^ *"sha256": "\([0-9a-f]\{64\}\)",$/\1/p' <<<"$package_terminal")

fetch_node=$(upstream apps/desktop/scripts/fetch-node.sh)
node_version=$(sed -n 's/^NODE_VERSION="\${STRATA_NODE_VERSION:-\([0-9.]*\)}"$/\1/p' <<<"$fetch_node")
node_sha256=$(sed -n 's/^ *linux-x64) *echo "\([0-9a-f]\{64\}\)".*/\1/p' <<<"$fetch_node")

for var in harness_commit pbs_release python_version pbs_sha256 node_version node_sha256; do
    [ -n "${!var}" ] || { echo "update-pins: could not read ${var}" >&2; exit 1; }
    old=$(awk -F= -v k="_${var}" '$1 == k { print $2 }' PKGBUILD)
    [ -n "$old" ] || { echo "update-pins: _${var}= not found in PKGBUILD" >&2; exit 1; }
    if [ "$old" = "${!var}" ]; then
        printf '  %-16s %s\n' "_${var}" "${!var}"
    else
        printf '  %-16s %s -> %s\n' "_${var}" "$old" "${!var}"
        sed -i "s|^_${var}=.*|_${var}=${!var}|" PKGBUILD
    fi
done
