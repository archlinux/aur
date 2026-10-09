# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=javassist-bin
_pkgname=javassist
pkgver=3.33.0
pkgrel=1
pkgdesc="Java bytecode engineering toolkit (prebuilt jar from Maven Central)"
arch=('any')
url='https://www.javassist.org/'
license=('MPL-1.1' 'LGPL-2.1-or-later' 'Apache-2.0')
depends=('java-runtime')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("javassist-${pkgver}.jar::https://repo1.maven.org/maven2/org/javassist/javassist/${pkgver}-GA/javassist-${pkgver}-GA.jar")
sha256sums=('1620478adc5f4d2eccd356e59513c270f1508bed53ce75deffb3107b7b43db2c')

package() {
  install -Dm644 "javassist-${pkgver}.jar" "${pkgdir}/usr/share/java/javassist.jar"
}
