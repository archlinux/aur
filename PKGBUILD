# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=jna
pkgver=5.11.0
pkgrel=1
pkgdesc="Access native libraries with pure Java code."
arch=('any')
url='https://github.com/java-native-access/jna'
license=('LGPL' 'custom:Apache')
depends=('java-runtime')
source=("https://repo1.maven.org/maven2/net/java/dev/jna/jna/${pkgver}/jna-${pkgver}.jar"
        'https://raw.githubusercontent.com/java-native-access/jna/master/AL2.0'
        'https://raw.githubusercontent.com/java-native-access/jna/master/LGPL2.1'
        )
sha256sums=('e2bce99e4aefd4dab097019a799d317cb3b5d56c3ddd7984c69a772dceed0dd3'
            '0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594'
            'eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449'
            )

package() {
  install -Dm775 "${srcdir}/jna-${pkgver}.jar" "${pkgdir}/usr/share/java/jna.jar"

  install -Dm755 "${srcdir}/AL2.0" "${pkgdir}/usr/share/licenses/${pkgname}/AL2.0"
  install -Dm755 "${srcdir}/LGPL2.1" "${pkgdir}/usr/share/licenses/${pkgname}/LGPL2.1"
}
