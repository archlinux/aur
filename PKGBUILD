# Maintainer: Michael J. Pento <mjpento@verizon.net> 
# Contributor: David Hajek <dante4d at gmail dot com>

pkgname=apache-poi
_srcname=poi-bin
_srcdate=20170915
pkgver=3.17
pkgrel=2
pkgdesc="A Java library for Microsoft Documents"
arch=('any')
url="http://poi.apache.org/"
license=('APACHE')
optdepends=('java-runtime-common')
source=("http://mirror.hosting90.cz/apache/${_srcname:0:3}/release/${_srcname:4:6}/${_srcname}-${pkgver}-${_srcdate}.tar.gz")
sha256sums=('c28e15f3b66bcf9a5f7d13b40ac32610f5d5e0abec85367cca69f85df9ca949c')

package() {
  mkdir -p "${pkgdir}/usr/share/java"
  install -m 644 -D "${srcdir}/${_srcname:0:3}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  mv "${srcdir}/${_srcname:0:3}-${pkgver}" "${pkgdir}/usr/share/java/${pkgname}"
}
