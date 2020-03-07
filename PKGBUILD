# Maintainer: Michael J. Pento <mjpento@verizon.net> 

pkgname=apache-poi
_srcname=poi-bin
_srcdate=20200217
pkgver=4.1.2
pkgrel=1
pkgdesc="A Java library for Microsoft Documents"
arch=('any')
url="http://poi.apache.org/"
license=('APACHE')
optdepends=('java-runtime-common')
source=("http://mirror.hosting90.cz/apache/${_srcname:0:3}/release/${_srcname:4:6}/${_srcname}-${pkgver}-${_srcdate}.tar.gz")
sha256sums=('b869ffc376e8c5d2989bade5d415bc5843db3d0a8f17e56e242f9b520a848643')

package() {
  mkdir -p "${pkgdir}/usr/share/java"
  install -m 644 -D "${srcdir}/${_srcname:0:3}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  mv "${srcdir}/${_srcname:0:3}-${pkgver}" "${pkgdir}/usr/share/java/${pkgname}"
}
