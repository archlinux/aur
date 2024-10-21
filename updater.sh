#!/bin/bash

color_echo() {
    local color=$1
    local message=$2
    echo -e "\e[${color}m${message}\e[0m"
}

get_latest_version() {
    curl --silent "https://api.github.com/repos/Voxelum/x-minecraft-launcher/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/'
}

latest_version=$(get_latest_version)

color_echo "33" "Checking latest version..."

mkdir -p cache

amd64_sha256_file="./cache/xmcl-${latest_version#v}-amd64.deb.sha256"
arm64_sha256_file="./cache/xmcl-${latest_version#v}-arm64.deb.sha256"
if [ ! -f "$amd64_sha256_file" ]; then
    color_echo "36" "Downloading SHA256 for amd64..."
    wget -q -O "$amd64_sha256_file" "https://github.com/Voxelum/x-minecraft-launcher/releases/download/$latest_version/xmcl-${latest_version#v}-amd64.deb.sha256"
fi

if [ ! -f "$arm64_sha256_file" ]; then
    color_echo "36" "Downloading SHA256 for arm64..."
    wget -q -O "$arm64_sha256_file" "https://github.com/Voxelum/x-minecraft-launcher/releases/download/$latest_version/xmcl-${latest_version#v}-arm64.deb.sha256"
fi

sleep 1

sha256_amd64=$(cat "$amd64_sha256_file" | awk '{print $1}')
sha256_arm64=$(cat "$arm64_sha256_file" | awk '{print $1}')

color_echo "35" "Updating PKGBUILD..."
sed -i "s/^pkgver=.*/pkgver=${latest_version#v}/" PKGBUILD
sed -i "s/^sha256sums_x86_64=('.*')/sha256sums_x86_64=('$sha256_amd64')/" PKGBUILD
sed -i "s/^sha256sums_aarch64=('.*')/sha256sums_aarch64=('$sha256_arm64')/" PKGBUILD

color_echo "35" "Updating .SRCINFO..."
sed -i "s/^\tpkgver = .*/\tpkgver = ${latest_version#v}/" .SRCINFO
sed -i "s|\tsource = .*|\tsource = https://github.com/voxelum/x-minecraft-launcher/releases/tag/$latest_version|" .SRCINFO

color_echo "32" "Updated to version ${latest_version}"

color_echo "34" "Building package..."
makepkg -sf --noconfirm

color_echo "33" "Cleaning up old files..."

sleep 1
rm -rf xmcl-*-amd64.deb xmcl-*-arm xmcl-launcher-*-x86_64.pkg.tar.zst ./src ./pkg ./cache
