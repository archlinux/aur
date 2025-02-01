#!/usr/bin/env bash

current_version=$(grep 'pkgver=' PKGBUILD | awk -F '=' '{ print $2 }');

echo "Current version: $current_version";

tmp_dir=$(mktemp -d);

source ./PKGBUILD;

major_url=$(echo "${source[0]}" | awk -F '::' '{ print $2 }');

echo "fetching apifox-latest.zip from $major_url";
wget -q -O "$tmp_dir/apifox-latest.zip" "${major_url}";

cd "$tmp_dir" || exit;

echo "Parse version ...";

unzip -q apifox-latest.zip;

prepare;

next_version=$(pkgver);

cd - || exit;

echo "Next version: $next_version";


if [[ "${current_version}" == "${next_version}" ]]; then
    echo "Version is up-to-date";
    exit 0;
fi

echo "Version is outdated";

sed -i "s/pkgver=${current_version}/pkgver=${next_version}/" PKGBUILD;

echo "Update version to $next_version";
updpkgsums;