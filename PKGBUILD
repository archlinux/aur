# Maintainer: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=cura-binary-data
pkgver=2.4.0
pkgrel=1
pkgdesc="Binary data (firmwares and such) for cura"
depends=()
url="https://github.com/Ultimaker/${pkgname}"
license=('AGPLv3')
arch=('any')
#options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
source=(https://github.com/Ultimaker/${pkgname}/archive/${pkgver}.tar.gz)
sha1sums=('cbe03b3f0a3353d011dbfa09680dd12f677823b7')

package(){
  mkdir -p "${pkgdir}/usr/share"
  cp -r "${srcdir}/${pkgname}-${pkgver}/cura/" "${pkgdir}/usr/share/."
}


