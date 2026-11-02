# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=2.6.1
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=("x86_64")
url="https://github.com/stabldev/torrra"
license=("MIT")
provides=("torrra")
conflicts=("torrra")
source=("torrra-${pkgver}::$url/releases/download/v$pkgver/torrra_v${pkgver}_linux_x86_64")
sha256sums=('7dc76bb00e10793ff463f68fe074623690bc45aa1acd75b18787fcb4eafd27b9')

package() {
    install -Dm755 "torrra-$pkgver" "$pkgdir/usr/bin/torrra"
}
