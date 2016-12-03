# Maintainer: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=cura-binary-data
pkgver=2.3.1
pkgrel=1
pkgdesc="Binary data (firmwares and such) for cura"
depends=()
url="https://github.com/Ultimaker/${pkgname}"
license=('AGPLv3')
arch=('any')
#options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
source=(https://github.com/Ultimaker/${pkgname}/archive/${pkgver}.tar.gz)
sha1sums=('69998bab0efd410b481f8bb6ba6c8f650f2e87e8')

package(){
  mkdir -p "${pkgdir}/usr/share"
  cp -r "${srcdir}/${pkgname}-${pkgver}/cura/" "${pkgdir}/usr/share/."
  cp -r "${srcdir}/${pkgname}-${pkgver}/uranium/" "${pkgdir}/usr/share/."
}


