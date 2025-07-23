# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=('x86_64')
url="https://github.com/stabldev/torrra"
license=('MIT')
depends=()
provides=('torrra')
conflicts=('torrra')
source=("https://github.com/stabldev/torrra/releases/download/v${pkgver}/torrra_${pkgver}_linux_x86_64")
sha256sums=('693ee847e68f4623bf9588e5e93cfed32cb3b8ae089f44f74a397435095f110f')

package() {
    install -Dm755 "torrra_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/torrra"
}
