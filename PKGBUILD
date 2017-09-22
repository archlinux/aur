# Maintainer: beest <gnubeest at zoho dot com>
# Contributor: Alexander F Rødseth <xyproto at archlinux dot org>

pkgname=ski
pkgver=6.12
pkgrel=1
pkgdesc='A hotdogging game, evade the deadly Yeti on your jet-powered skis.'
arch=('any')
depends=('python')
makedepends=('xmlto')
url='http://www.catb.org/esr/ski/'
license=('GPL')
source=("http://www.catb.org/esr/ski/ski-$pkgver.tar.gz")
sha256sums=('2f34f64868deb0cc773528c68d9829119fac359c44a704695214d87773df5a33')

build() {
    cd "$pkgname-$pkgver"

    make
}

package() {
    cd "$pkgname-$pkgver"

    make DESTDIR="$pkgdir/" install
}
