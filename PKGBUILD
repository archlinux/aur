# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=("x86_64")
url="https://github.com/stabldev/torrra"
license=("MIT")
provides=("torrra")
conflicts=("torrra")
source=("torrra-${pkgver}::$url/releases/download/v$pkgver/torrra_v${pkgver}_linux_x86_64")
sha256sums=('c855c50394268aadb55b4581abe650aaa4a6102d013d8eea9af5fbdceff2244f')

package() {
    install -Dm755 "torrra-$pkgver" "$pkgdir/usr/bin/torrra"
}
