# Maintainer: ThecaTTony <thecattony at gmx dot com>
# Contributor: Adrian Carpenter <adriatic.c at gmail dot com>

pkgname=fmtools
pkgver=2.0.7
pkgrel=1
pkgdesc="A pair of simple command-line utilities for v4l2 radio tuner cards"
arch=(i686 x86_64)
url="http://benpfaff.org/fmtools/"
license=('GPL')
source=(http://benpfaff.org/fmtools/${pkgname}-${pkgver}.tar.gz)
md5sums=('132b6d305b0c48eb8da0610873b15d62')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
