# Maintainer: Ryan Jacobs <ryan.mjacobs@gmail.com>
pkgname=tl
pkgver=0.02
pkgrel=1
pkgdesc='Painless timelapsing to show off your productivity.'
arch=('any')
url="https://github.com/ryanmjacobs/tl"
license=('MIT')
provides=('tl')
conflicts=('tl')
source=("https://github.com/ryanmjacobs/tl/archive/v${pkgver}.tar.gz")
md5sums=('637e3ba4d4b6816eeac95128704cb3bd')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install PREFIX=${pkgdir}/usr
}
