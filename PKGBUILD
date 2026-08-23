# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=2.1.4
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=("x86_64")
url="https://github.com/stabldev/torrra"
license=("MIT")
provides=("torrra")
conflicts=("torrra")
source=("torrra-${pkgver}::$url/releases/download/v$pkgver/torrra_v${pkgver}_linux_x86_64")
sha256sums=('82c61d1956552a29024aa1c89e197f0d2d4968e96bf5c82e8379bdc20eafb144')

package() {
    install -Dm755 "torrra-$pkgver" "$pkgdir/usr/bin/torrra"
}
