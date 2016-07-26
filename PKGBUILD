# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=odt2tex
pkgver=0.0.12
pkgrel=1
pkgdesc="Convert odt files to tex"
url="https://www.chronowerks.de"
arch=('x86_64' 'i686')
license=('MIT')
depends=('libzip' 'expat')
makedepends=('libzip' 'expat')
source=("https://github.com/simonaw/odt2tex/archive/${pkgver}.tar.gz")
md5sums=('bf0f2ba869a2932b55b59c9b402df9a0');
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/usr/bin/${pkgname}" install
}
