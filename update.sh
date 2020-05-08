#!/usr/bin/env bash

set -euo pipefail

tarball=$(curl https://pkgs.tailscale.com/stable/ 2>/dev/null | grep amd64.tgz | cut -f2 -d'"')
version=$(echo $tarball | cut -f2 -d'_')
pkgver=$(echo $version | tr '-' '_')
sha256=$(curl https://pkgs.tailscale.com/stable/$tarball 2>/dev/null | sha256sum | cut -f1 -d' ')

cat >PKGBUILD <<EOF
# Maintainer: David Anderson <dave@natulte.net>

pkgname="tailscale"
_version="$version"
pkgver="$pkgver"
pkgrel="1"
pkgdesc="A mesh VPN that makes it easy to connect your devices, wherever they are."
arch=("x86_64")
url="https://tailscale.com"
license=("MIT")
depends=("glibc")
backup=("etc/default/tailscaled")
source=("\$pkgname-\$pkgver.tgz::https://pkgs.tailscale.com/stable/tailscale_\${_version}_amd64.tgz")
sha256sums=('$sha256')
install="tailscale.install"

package() {
    cd tailscale_\${_version}_amd64
  mkdir -p "\$pkgdir/usr/bin" "\$pkgdir/etc/default" "\$pkgdir/usr/lib/systemd/system"
  install -m755 tailscale tailscaled "\$pkgdir/usr/bin"
  install -m644 systemd/tailscaled.defaults "\$pkgdir/etc/default/tailscaled"
  install -m644 systemd/tailscaled.service "\$pkgdir/usr/lib/systemd/system"
}
EOF

conf=/etc/makepkg.conf
if [ ! -f "$conf" ]; then
    # makepkg.conf location in Nix package.
    conf="$(dirname `which makepkg`)/../etc/makepkg.conf"
fi
makepkg --config="$conf" --printsrcinfo >.SRCINFO
git commit -a -m "Update to version $version"
