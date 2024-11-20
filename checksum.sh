#!/bin/bash
[ -z "$1" ] && { echo "usage $0 <PKGVERSION>"; exit 1; }
wget -qO kubelogin-amd64.sha256 https://github.com/int128/kubelogin/releases/download/v$1/kubelogin_linux_amd64.zip.sha256
wget -qO kubelogin-arm64.sha256 https://github.com/int128/kubelogin/releases/download/v$1/kubelogin_linux_arm64.zip.sha256
echo ""
echo -n "amd64: "
cat kubelogin-amd64.sha256
echo -n "arm64: "
cat kubelogin-arm64.sha256
rm kubelogin-amd64.sha256
rm kubelogin-arm64.sha256
