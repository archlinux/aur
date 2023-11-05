# Maintainer: andym <andrew dot myers at wanadoo dot fr>
pkgname=pdf4tcl
pkgver=094
pkgrel=1
pkgdesc="Pdf4Tcl is a library for generating PDF documents from Tcl."
arch=('any')
url="http://sourceforge.net/projects/pdf4tcl"
license=('BSD')
depends=('tcl>=8.6' 'tk>=8.6')
#install=$pkgname.install
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}${pkgver}.tar.gz")
md5sums=('b2c960b2f19f4bb5205a0d57ca6056f3')

package() {
  cd "${srcdir}/${pkgname}${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -R * "${pkgdir}/usr/lib/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
  cp licence.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}



