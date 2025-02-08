#!/usr/bin/env bash

current_version=$(grep 'pkgver=' PKGBUILD | awk -F '=' '{ print $2 }');

echo "Current version: $current_version";

current_file="apifox-v${current_version}.zip"

[ -e "${current_file}" ] && rm "${current_file}";

updpkgsums;

# 使用 file 命令检查文件类型
current_file_mime_type=$(file --mime-type -b "${current_file}")

# 判断文件类型是否为 zip
if [ "${current_file_mime_type}" != "application/zip" ] && [ "${current_file_mime_type}" != "application/octet-stream" ] ; then
    rm "${current_file}";
    git checkout PKGBUILD;
    echo "Fetch ${current_file} not zip , restricted !";
    exit 2;
fi

source ./PKGBUILD;

echo "Parse version ...";

temp_dir=$(mktemp -d);

unzip -q "${current_file}" -d "${temp_dir}";

cd "${temp_dir}" || exit 1;

prepare;

next_version=$(pkgver);

cd - || exit 1;

echo "Next version: ${next_version}";


if [[ "${current_version}" == "${next_version}" ]]; then
    echo "Version is up-to-date";
    exit 0;
fi

echo "Version is outdated";

sed -i "s/pkgver=${current_version}/pkgver=${next_version}/" PKGBUILD;

echo "Update version to $next_version";

mv "${current_file}" "apifox-v${next_version}.zip";

makepkg --printsrcinfo > .SRCINFO