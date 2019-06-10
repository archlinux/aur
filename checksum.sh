#!/bin/bash
[ -z "$1" ] && { echo "usage $0 <PKGVERSION>"; exit 1; }
wget -qO kubelogin.sha256 https://github.com/int128/kubelogin/releases/download/v$1/kubelogin_linux_amd64.zip.sha256
cat kubelogin.sha256
echo ""
rm kubelogin.sha256
