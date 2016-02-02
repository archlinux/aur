# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=odt2tex
pkgver=0.0.9b
pkgrel=1
pkgdesc="Convert odt files to tex"
url="https://www.chronowerks.de"
arch=('x86_64' 'i686')
license=('MIT')
depends=('libzip' 'expat')
makedepends=('libzip' 'expat')
source=("https://github.com/simonaw/odt2tex/archive/${pkgver}.tar.gz")
md5sums=('a4abb98d2f33445a717b1de5ae9e5e60');
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/usr/bin/${pkgname}" install
}
