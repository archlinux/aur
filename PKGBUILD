# Maintainer: Michael J. Pento <mjpento@verizon.net> 

pkgname=apache-poi
_binname=poi-bin
_bindate=20220312
pkgver=5.2.2
pkgrel=1
pkgdesc="A Java library for Microsoft Documents"
arch=('any')
url="http://poi.apache.org/"
license=('APACHE')
optdepends=('java-runtime-common')
source=("https://dlcdn.apache.org/poi/release/bin/${_binname}-${pkgver}-${_bindate}.tgz")
sha256sums=('911ee092f972c588914eec7309d9246369eabe9ba532b58a6ebb5dcb9f6c666c')

package() {
  mkdir -p "${pkgdir}/usr/share/java"
  install -m 644 -D "${srcdir}/${_binname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  mv "${srcdir}/${_binname}-${pkgver}" "${pkgdir}/usr/share/java/${pkgname}"
}
