# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: David Hajek <dante4d at gmail dot com>

pkgname=apache-poi
_srcname=poi-bin
pkgver=3.14
pkgrel=1
pkgdesc="A Java library for Microsoft Documents"
arch=('any')
url="http://poi.apache.org/"
license=('APACHE')
optdepends=('java-runtime-common')
source=("http://mirror.hosting90.cz/apache/${_srcname:0:3}/release/${_srcname:4:6}/${_srcname}-${pkgver}.tar.gz")
sha256sums=('4aeef6a01d966510fb9d8e07faa04d8dfa6a87234beb4cd07619f914dd1b02ec')

package() {
  mkdir -p "${pkgdir}/usr/share/java"
  install -m 644 -D "${srcdir}/${_srcname:0:3}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  mv "${srcdir}/${_srcname:0:3}-${pkgver}" "${pkgdir}/usr/share/java/${pkgname}"
}
