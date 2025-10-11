# Maintainer: Mike Pento <mjpento@gmail.com>

pkgname=apache-poi
_binname=poi-bin
_bindate=20220909
pkgver=5.2.3
pkgrel=1
pkgdesc="A Java library for Microsoft Documents"
arch=('any')
url="http://poi.apache.org/"
license=('APACHE')
optdepends=('java-runtime-common')
source=("https://archive.apache.org/dist/poi/release/bin/${_binname}-${pkgver}-${_bindate}.tgz")
sha256sums=('2c09ba08b853a07b0b775a2e8f103d92fa17d8a5fd1950b12256a0397b3aa403')

package() {
  mkdir -p "${pkgdir}/usr/share/java"
  install -m 644 -D "${srcdir}/${_binname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  mv "${srcdir}/${_binname}-${pkgver}" "${pkgdir}/usr/share/java/${pkgname}"
}
