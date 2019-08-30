# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=jna
pkgver=5.4.0
pkgrel=1
pkgdesc="Access native libraries with pure Java code."
arch=('any')
url='https://github.com/java-native-access/jna'
license=('LGPL' 'custom:Apache')
depends=('java-runtime')
source=("http://central.maven.org/maven2/net/java/dev/jna/jna/${pkgver}/jna-${pkgver}.jar"
        'https://raw.githubusercontent.com/java-native-access/jna/master/AL2.0'
        'https://raw.githubusercontent.com/java-native-access/jna/master/LGPL2.1'
        )
sha256sums=('7939b06f62747d2615416479c739fc8ebdcf48bdd1d554bf7409e686fa1ff0ea'
            '0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594'
            'eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449'
            )

package() {
  install -Dm775 "${srcdir}/jna-${pkgver}.jar" "${pkgdir}/usr/share/java/jna.jar"

  install -Dm755 "${srcdir}/AL2.0" "${pkgdir}/usr/share/licenses/${pkgname}/AL2.0"
  install -Dm755 "${srcdir}/LGPL2.1" "${pkgdir}/usr/share/licenses/${pkgname}/LGPL2.1"
}
