# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=jna
pkgver=4.2.2
pkgrel=1
pkgdesc="Access native libraries with pure Java code."
arch=('any')
url='https://github.com/java-native-access/jna'
license=('LGPL' 'custom:Apache')
depends=('java-runtime')
source=("https://maven.java.net/content/repositories/releases/net/java/dev/jna/jna/${pkgver}/jna-${pkgver}.jar"
        'https://raw.githubusercontent.com/java-native-access/jna/master/LICENSE.AL')
sha1sums=('5012450aee579c3118ff09461d5ce210e0cdc2a9'
          'df9e80c3d0f50a5f10b377acb193c8b8a33c023a')

package() {

  install -Dm775 "${srcdir}/jna-${pkgver}.jar" "${pkgdir}/usr/share/java/jna.jar"

  install -Dm755 "${srcdir}/LICENSE.AL" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
