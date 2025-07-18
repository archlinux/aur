# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=('x86_64')
url="https://github.com/stabldev/torrra"
license=('MIT')
depends=()
provides=('torrra')
conflicts=('torrra')
source=("https://github.com/stabldev/torrra/releases/download/v${pkgver}/torrra-v${pkgver}-linux-x86_64")
sha256sums=('a3a82279464d7fbe55ac84411aa6fd0ee9b3fffbacdc660a7d92d035bf6a4b6f')

package() {
    install -Dm755 "torrra-v${pkgver}-linux-x86_64" "$pkgdir/usr/bin/torrra"
}
