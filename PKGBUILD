# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=odt2tex
pkgver=0.0.11
pkgrel=1
pkgdesc="Convert odt files to tex"
url="https://www.chronowerks.de"
arch=('x86_64' 'i686')
license=('MIT')
depends=('libzip' 'expat')
makedepends=('libzip' 'expat')
source=("https://github.com/simonaw/odt2tex/archive/${pkgver}.tar.gz")
md5sums=('575875f940998a7e2a376bebb01c2e85');
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/usr/bin/${pkgname}" install
}
