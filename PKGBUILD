# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=("x86_64")
url="https://github.com/stabldev/torrra"
license=("MIT")
provides=("torrra")
conflicts=("torrra")
source=("torrra-${pkgver}::$url/releases/download/v$pkgver/torrra_v${pkgver}_linux_x86_64")
sha256sums=('7226d39eb7be3de8b32167ed4641bd3328b5effcac796149d959ac8fa61dc759')

package() {
    install -Dm755 "torrra-$pkgver" "$pkgdir/usr/bin/torrra"
}
