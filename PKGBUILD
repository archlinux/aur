# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

pkgname=opustags
pkgver=1.1
pkgrel=1
pkgdesc='Opus tags editor'

url='https://github.com/fmang/opustags'
license=('BSD3')

arch=('i686' 'x86_64')
depends=('glibc' 'libogg')
makedepends=('gcc' 'make')

source=(http://mg0.fr/pub/c/${pkgname}-${pkgver}.tar.gz)
sha1sums=('e23a075bfb3fbf6a3e79a95f9208927931a17533')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/usr" install
}
