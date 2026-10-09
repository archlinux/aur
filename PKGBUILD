# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=jna-platform
pkgver=5.17.0
pkgrel=1
pkgdesc="Cross-platform mappings for JNA (jna-platform.jar)"
arch=('any')
url='https://github.com/java-native-access/jna'
license=('LGPL-2.1-or-later' 'Apache-2.0')
depends=('java-runtime' 'jna')
source=(
  "https://repo1.maven.org/maven2/net/java/dev/jna/jna-platform/${pkgver}/jna-platform-${pkgver}.jar"
  'https://raw.githubusercontent.com/java-native-access/jna/master/AL2.0'
  'https://raw.githubusercontent.com/java-native-access/jna/master/LGPL2.1'
)
sha256sums=('b7e3d46c87bad2eb409b0e704916bcd81206168e357312dfddd0e253679cd9e0'
            '0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594'
            'eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449')

package() {
  install -Dm644 "${srcdir}/jna-platform-${pkgver}.jar" "${pkgdir}/usr/share/java/jna-platform.jar"
  install -Dm644 "${srcdir}/AL2.0"    "${pkgdir}/usr/share/licenses/${pkgname}/AL2.0"
  install -Dm644 "${srcdir}/LGPL2.1"  "${pkgdir}/usr/share/licenses/${pkgname}/LGPL2.1"
}
