# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=('x86_64')
url="https://github.com/stabldev/torrra"
license=('MIT')
depends=()
provides=('torrra')
conflicts=('torrra')
source=("https://github.com/stabldev/torrra/releases/download/v${pkgver}/torrra_${pkgver}_linux_x86_64")
sha256sums=('f4b5847ce4b4dfe676b2396155139655f651bb8b29b3e0ce7971b873b882a223')

package() {
    install -Dm755 "torrra_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/torrra"
}
