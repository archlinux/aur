# Maintainer: Matthew Wilding <mbwilding at gmail dot com>

pkgname=("ttf-neospleen")
pkgver=1.0.44
pkgrel=1
pkgdesc="A modern monospaced font inspired by Spleen"
url="https://github.com/mbwilding/NeoSpleen"
license=("BSD-2-Clause")
arch=("any")
source=("https://github.com/mbwilding/NeoSpleen/releases/download/$pkgver/NeoSpleen.ttf")
b2sums=('01d9e7f332ae4d0390e3f230e711fde44904d39965c310ab9319c1e5fcf1e1b4'
        'SKIP')

package() {
    install -D -m 644 "NeoSpleen.ttf" -t "$pkgdir/usr/share/fonts/TTF"
}
