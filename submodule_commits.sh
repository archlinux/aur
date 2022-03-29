#!/bin/bash
# Generate submodule commit hashes
# This is just for PKGBUILD maintenance and is not supposed to be packaged.
source PKGBUILD
submodules="$(printf "|%s" "${_submodules[@]}")"
curl -s https://api.github.com/repos/VCVRack/Rack/contents/dep?ref=v$pkgver | \
  jq -r '[.[] | select(.name | test("'"${submodules:1}"'"))] | ("_submodules=(" + ([.[].name] | join(" ")) + ")", "_commits=(" + ([.[].sha[:7]] | join(" ")) + ")")'
