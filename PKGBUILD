# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor: <clu>
# Contributor: Dominik Fuchs <dominik.fuchs@wur.nl>
# Contributor: Michele Vascellari

pkgname=g3data
pkgver=1.5.4
pkgrel=1
pkgdesc="A tool for extracting data from scanned graphs."
arch=('i686' 'x86_64')
url="https://github.com/pn2200/g3data"
license=('GPL2')
depends=('gtk2>=2.6')
makedepends=()
source=(https://github.com/downloads/pn2200/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('acb41e54ee5fbf167413218f209c4e3f')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=${pkgdir}/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make install
}
