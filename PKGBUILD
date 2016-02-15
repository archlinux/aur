# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: David Hajek <dante4d at gmail dot com>

pkgname=apache-poi
pkgver=3.13
pkgrel=20150929
pkgdesc="A Java library for Microsoft Documents"
arch=('any')
url="http://poi.apache.org/"
license=('APACHE')
optdepends=('java-runtime-common')
source=("http://mirror.hosting90.cz/apache/poi/release/bin/poi-bin-$pkgver-${pkgrel}.tar.gz")
sha256sums=('5fdff8b2da3c4896655cb823abf1fd6e2c603eaf24d956ab7a3a5d6f010004c6')

package() {
  mkdir -p "${pkgdir}/usr/share/java"
  install -m 644 -D "${srcdir}/${pkgname:7:10}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  mv "${srcdir}/${pkgname:7:10}-${pkgver}" "${pkgdir}/usr/share/java/${pkgname}"
}
