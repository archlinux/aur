# Maintainer: Philippe Loctaux <loctauxphilippe@gmail.com>

pkgname=crand
pkgver=0.3
pkgrel=1
pkgdesc="Randomizer of text strings"
arch=('i686' 'x86_64')
url="https://github.com/loctauxphilippe/${pkgname}"
license=('GPL2')
depends=('glibc')
source=("https://github.com/loctauxphilippe/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('5509d5106101f9b7545971ad3597dcb5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
