#!/usr/bin/env bash

set -euo pipefail

# Helper script for maintainers to update the PKGBUILD sources array such that any submodules reference the same commit
# listed in the main repository.

# Motivation:
# GitHub release zips do not contain submodules (the content, nor the commit hash).
# Thankfully, the PKGBUILD doesn't have to find this information as a part of the build process -- the PKGBUILD can just
# reference the submodules by manually including them in the sources array.
# Then, upon new releases of the packaged software, as a part of the routine update process, the maintainer can run this
# script to automate the updating of those submodule sources.

# Requires:
# curl
# jq

function fetch_hash {
    curl -sH "Accept: application/vnd.github.v3+json" \
        https://api.github.com/repos/anatawa12/vrc-get/contents/vrc-get-litedb/dotnet/LiteDB \
        | jq -r '.sha'
}

function main {
    new_hash="$(fetch_hash)"
    # example:
    # _submodule_LiteDB_commit='7e7ceac241aceb60369e955374ff1353e4b4a22c'
    find_me='^(_submodule_LiteDB_commit)='\''[a-z0-9]{40}'\''$'
    if ! grep -qE "$find_me" PKGBUILD; then
        echo "Couldn't find submodule commit line" >&2
        return 1
    fi
    sed -ri 's/'"$find_me"'/\1='"'$new_hash'"'/' PKGBUILD
}

main
