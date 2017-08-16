# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=jna
pkgver=4.4.0
pkgrel=1
pkgdesc="Access native libraries with pure Java code."
arch=('any')
url='https://github.com/java-native-access/jna'
license=('LGPL' 'custom:Apache')
depends=('java-runtime')
source=("http://central.maven.org/maven2/net/java/dev/jna/jna/${pkgver}/jna-${pkgver}.jar"
        'https://raw.githubusercontent.com/java-native-access/jna/master/LICENSE.AL'
        )
sha256sums=('c4dadeeecaa90c8847902082aee5eb107fcf59c5d0e63a17fcaf273c0e2d2bd1'
            'd67be85caf7da46ea5c21495e197e7df6c70fd9d9b027a32b951cc745fa5400e'
            )

package() {

  install -Dm775 "${srcdir}/jna-${pkgver}.jar" "${pkgdir}/usr/share/java/jna.jar"

  install -Dm755 "${srcdir}/LICENSE.AL" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
