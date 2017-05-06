# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: David Hajek <dante4d at gmail dot com>

pkgname=apache-poi
_srcname=poi-bin
_srcdate=20170419
pkgver=3.16
pkgrel=1
pkgdesc="A Java library for Microsoft Documents"
arch=('any')
url="http://poi.apache.org/"
license=('APACHE')
optdepends=('java-runtime-common')
source=("http://mirror.hosting90.cz/apache/${_srcname:0:3}/release/${_srcname:4:6}/${_srcname}-${pkgver}-${_srcdate}.tar.gz")
sha256sums=('66711d5404aedc7ca809953af6c63ec67ff44fb764b1b93f3b2c96aa23d16b97')

package() {
  mkdir -p "${pkgdir}/usr/share/java"
  install -m 644 -D "${srcdir}/${_srcname:0:3}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  mv "${srcdir}/${_srcname:0:3}-${pkgver}" "${pkgdir}/usr/share/java/${pkgname}"
}
