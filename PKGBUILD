# Maintainer: <andrew dot myers at fdservices  dot co dot uk>
pkgname=pdf4tcl
pkgver=091
pkgrel=1
pkgdesc="Pdf4Tcl is a library for generating PDF documents from Tcl."
arch=('any')
url="http://sourceforge.net/projects/pdf4tcl"
license=('BSD')
depends=('tcl>=8.6' 'tk>=8.6')
#install=$pkgname.install
source=(https://sourceforge.net/projects/${pkgname}/files/${pkgname}${pkgver}.tar.gz)
md5sums=('cd2e9601e68af27eebd32045e42d1363')

package() {
  cd ${srcdir}/${pkgname}${pkgver}
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -R * "${pkgdir}/usr/lib/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/licences/${pkgname}/LICENCE"
  cp licence.terms "${pkgdir}/usr/share/licences/${pkgname}/LICENCE"
}







