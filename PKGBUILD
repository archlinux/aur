# Maintainer: Genki Sky <arch at genki dot is>

pkgname=human-git
pkgver=20160501.50c80e6
pkgrel=1
pkgdesc='Output a number in human-readable format'
arch=('any')
url='http://git.z3bra.org/human/log.html'
license=('WTFPL')
makedepends=('git')
provides=('git')
conflicts=('git')
source=('git://z3bra.org/human')
md5sums=('SKIP')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
