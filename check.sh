#!/usr/bin/env bash

# need: curl, jq

_buildver_line=$(cat PKGBUILD | grep '^_buildver=')
_pkgver_line=$(cat PKGBUILD | grep '^pkgver=')

_builddate=${_pkgver_line:7}

_current_builddate="${_builddate:0:4}-${_builddate:4:2}-${_builddate:6}"
_current_buildver=${_buildver_line:10}

echo "Current build:"
echo " date: ${_current_builddate}"
echo " version: ${_current_buildver}"

echo "Fetching latest JSON version..."

_json_version=$(curl https://ziglang.org/download/index.json)
#_json_version=$(cat index.json)

_latest_builddate=$(echo ${_json_version} | jq -r '.["master"]["date"]')
_latest_buildver=$(echo ${_json_version} | jq -r '.["master"]["version"]')

echo "Parsed latest build:"
echo " date: ${_latest_builddate}"
echo " version: ${_latest_buildver}"

#_new_builddate=$(echo ${_latest_builddate} | tr -d '-')
_new_builddate=${_latest_builddate//-}

if [[ ${_latest_buildver} == ${_current_buildver} ]]; then
    echo "No new build yet."
else
    if [[ ! (${_new_builddate} -lt ${_builddate}) ]]; then
        _latest_tarball=$(echo ${_json_version} | jq -r '.["master"]["x86_64-linux"]["tarball"]')
        _latest_sha256=$(echo ${_json_version} | jq -r '.["master"]["x86_64-linux"]["shasum"]')
        _latest_size=$(echo ${_json_version} | jq -r '.["master"]["x86_64-linux"]["size"]')
        echo "New build:"
        echo " date: ${_latest_builddate}"
        echo " version: ${_latest_buildver}"
        echo " tarball: ${_latest_tarball}"
        echo " sha256: ${_latest_sha256}"
        echo " size: ${_latest_size}"
    else
        echo "No new build yet."
    fi
fi
