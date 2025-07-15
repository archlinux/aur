# Maintainer: Sauru <sauruuwu at gmail dot com>

pkgname=sai
pkgver=1.2
pkgrel=1
pkgdesc='SAI - MKV Muxing Automator from ASS'
arch=(x86_64)
url=https://github.com/olivo28/SAI
license=(GPL-3.0-or-later)
depends=(mkvtoolnix-cli)
source=(https://github.com/olivo28/SAI/releases/download/$pkgver/sai.rar)
sha256sums=(9e612c2f1a094d3cc947957cab0eae1c98ff79c7ea75cad1bdf7fd77dc79aef4)

package() {
    install -Dm755 "sai" "$pkgdir/usr/bin/sai"
}