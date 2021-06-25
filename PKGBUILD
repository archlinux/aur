# Maintainer: Christopher Brown <cebrown5597@gmail.com>

pkgname=fortune-mod-hackers
pkgver=1
pkgrel=1
pkgdesc="Quotes from the movie Hackers fortune cookie file"
arch=('any')
license=('GPL')
url="https://github.com/free-city-of-ulm"
depends=('fortune-mod')
groups=('fortune-mod')

source=('hackers')
sha256sums=('c4c9829da62777860051005acc612cd722d3a7e260f948929ce4ab8b4f1b018c')

build() {
    strfile ${srcdir}/hackers ${srcdir}/hackers.dat
}

package() {
    install -D -m644 ${srcdir}/hackers ${pkgdir}/usr/share/fortune/hackers
    install -D -m644 ${srcdir}/hackers.dat ${pkgdir}/usr/share/fortune/hackers.dat
}
