# Maintainer: Michael J. Pento <mjpento@verizon.net> 

pkgname=apache-poi
_binname=poi-bin
_bindate=20211024
pkgver=5.1.0
pkgrel=1
pkgdesc="A Java library for Microsoft Documents"
arch=('any')
url="http://poi.apache.org/"
license=('APACHE')
optdepends=('java-runtime-common')
source=("https://dlcdn.apache.org/poi/release/bin/${_binname}-${pkgver}-${_bindate}.tgz")
sha256sums=('15ea654a4bdd883504bc1b1361cb0f1f4998189fe79091a56e812b54138c67c6')

package() {
  mkdir -p "${pkgdir}/usr/share/java"
  install -m 644 -D "${srcdir}/${_binname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  mv "${srcdir}/${_binname}-${pkgver}" "${pkgdir}/usr/share/java/${pkgname}"
}
