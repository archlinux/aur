# Maintainer: Creptic <creptics@gmail.com>
pkgname=qbtctl-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Minimal CLI for qBittorrent (prebuilt static binary)"
arch=('x86_64')
url="https://github.com/creptic/qbtctl"
license=('MIT')
depends=()
options=('!debug')
conflicts=('qbtctl' 'qbtctl-git')
provides=('qbtctl')

# Download the binary; use ::filename to ensure proper name
source=("https://github.com/creptic/qbtctl/releases/download/${pkgver}/qbtctl")
noextract=("qbtctl")

package() {
    install -Dm755 "$srcdir/qbtctl" "$pkgdir/usr/bin/qbtctl"
}

sha256sums=('fe90c64a7778db56c16162319dbea9ce790d9e7f9eea9571cd05e6170810c8e7')
