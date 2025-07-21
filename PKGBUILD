# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=1.1.0
pkgrel=2
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=('x86_64')
url="https://github.com/stabldev/torrra"
license=('MIT')
depends=()
provides=('torrra')
conflicts=('torrra')
source=("https://github.com/stabldev/torrra/releases/download/v${pkgver}/torrra_${pkgver}_linux_x86_64")
sha256sums=('cc185911dd70156acd5a6c4f2af222e6d9e76094e1d6fddfec82f5402bbddd97')

package() {
    install -Dm755 "torrra_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/torrra"
}
