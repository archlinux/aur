# Maintainer: Michael J. Pento <mjpento@verizon.net> 

pkgname=apache-poi
_srcname=poi-bin
_srcdate=20210120
pkgver=5.0.0
pkgrel=1
pkgdesc="A Java library for Microsoft Documents"
arch=('any')
url="http://poi.apache.org/"
license=('APACHE')
optdepends=('java-runtime-common')
source=("http://mirror.hosting90.cz/apache/${_srcname:0:3}/release/${_srcname:4:6}/${_srcname}-${pkgver}-${_srcdate}.tar.gz")
sha256sums=('a0a1f7da42951fea81a0ce622526b422560418aea441902926c1087ba0b3ff29')

package() {
  mkdir -p "${pkgdir}/usr/share/java"
  install -m 644 -D "${srcdir}/${_srcname:0:3}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  mv "${srcdir}/${_srcname:0:3}-${pkgver}" "${pkgdir}/usr/share/java/${pkgname}"
}
