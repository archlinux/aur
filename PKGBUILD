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
sha512sums=('b4651eb6ba87ddb745c46520ccf2d7146d179e69a614d7c6c247b82eaf188b30e955d60e7df59419f63a304a5c5215829d3bea3cc233d2729ff599c523d852e2')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=${pkgdir}/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make install
}
