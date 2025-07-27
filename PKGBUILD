# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=('x86_64')
url="https://github.com/stabldev/torrra"
license=('MIT')
depends=()
provides=('torrra')
conflicts=('torrra')
source=("https://github.com/stabldev/torrra/releases/download/v${pkgver}/torrra_${pkgver}_linux_x86_64")
sha256sums=('02e631fa5d8821cb19a5ed7e5837c0668385ee15b11233ef31700ad67f8a4037')

package() {
    install -Dm755 "torrra_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/torrra"
}
