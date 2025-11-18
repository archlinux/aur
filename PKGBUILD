# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=1.3.4
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=("x86_64")
url="https://github.com/stabldev/torrra"
license=("MIT")
provides=("torrra")
conflicts=("torrra")
source=("torrra-${pkgver}::$url/releases/download/v$pkgver/torrra_v${pkgver}_linux_x86_64")
sha256sums=('43c1a6a3a416b83149813b28a20af8ffaea74a147156317bc16d60ab7fee07b8')

package() {
    install -Dm755 "torrra-$pkgver" "$pkgdir/usr/bin/torrra"
}
