# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: xantares <xantares09 at hotmail dot com>

pkgname=random123
pkgver=1.13.2
pkgrel=1
pkgdesc="counter-based random number generators library"
arch=(any)
url="https://www.deshawresearch.com/resources_${pkgname}.html"
license=('BSD')
source=("https://www.deshawresearch.com/downloads/download_${pkgname}.cgi/${pkgname^}-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname^}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname^}-${pkgver}"
  install -d "${pkgdir}/usr"
  cp -r "include" "${pkgdir}/usr"
}
