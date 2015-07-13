# Maintainer: Ryan Jacobs <ryan.mjacobs@gmail.com>
pkgname=tl
pkgver=0.01
pkgrel=1
pkgdesc='Painless timelapsing to show off your productivity.'
arch=('any')
url="https://github.com/ryanmjacobs/tl"
license=('MIT')
provides=('tl')
conflicts=('tl')
source=('https://github.com/ryanmjacobs/tl/archive/v0.01.tar.gz')
md5sums=('13e66df3581d4936ec1c3594c6c7d554')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install PREFIX=${pkgdir}/usr
}
