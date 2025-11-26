# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=("x86_64")
url="https://github.com/stabldev/torrra"
license=("MIT")
provides=("torrra")
conflicts=("torrra")
source=("torrra-${pkgver}::$url/releases/download/v$pkgver/torrra_v${pkgver}_linux_x86_64")
sha256sums=('103840820a242a2ca2996cfb86d39b167c6d9806807ac1c70eeb07a9cb5cfb38')

package() {
    install -Dm755 "torrra-$pkgver" "$pkgdir/usr/bin/torrra"
}
