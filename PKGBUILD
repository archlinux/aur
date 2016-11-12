# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=jdeserialize
pkgver=1.2
pkgrel=3
pkgdesc='jdeserialize is a library that interprets Java serialized objects'
arch=('any')
url="https://code.google.com/p/jdeserialize/"
license=('BSD3')
depends=('java-environment')
options=('!strip')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}-${pkgver}.jar"
        'jdeserialize')
md5sums=('41088bf799525826e54a3da3b295e472'
         '37536c109f9348e8d9a529d5f8b6f69f')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib/jdeserialize"
  install -m644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/lib/jdeserialize/${pkgname}-${pkgver}.jar"
  install -m755 "${srcdir}/jdeserialize" "${pkgdir}/usr/bin/jdeserialize"
}
