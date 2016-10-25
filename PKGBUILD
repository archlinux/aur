# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: David Hajek <dante4d at gmail dot com>

pkgname=apache-poi
_srcname=poi-bin
_srcdate=20160924
pkgver=3.15
pkgrel=1
pkgdesc="A Java library for Microsoft Documents"
arch=('any')
url="http://poi.apache.org/"
license=('APACHE')
optdepends=('java-runtime-common')
source=("http://mirror.hosting90.cz/apache/${_srcname:0:3}/release/${_srcname:4:6}/${_srcname}-${pkgver}-${_srcdate}.tar.gz")
sha256sums=('fbcbb932574d67c5f1ca3fe985f240f0240dba96e54aa9e10164694690ee63d8')

package() {
  mkdir -p "${pkgdir}/usr/share/java"
  install -m 644 -D "${srcdir}/${_srcname:0:3}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  mv "${srcdir}/${_srcname:0:3}-${pkgver}" "${pkgdir}/usr/share/java/${pkgname}"
}
