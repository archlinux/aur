# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=jna
pkgver=4.2.1
pkgrel=1
pkgdesc="Access native libraries with pure Java code."
arch=('any')
url='https://github.com/java-native-access/jna'
license=('LGPL' 'custom:ASL')
depends=('java-runtime')
source=("https://maven.java.net/content/repositories/releases/net/java/dev/jna/jna/${pkgver}/jna-${pkgver}.jar"
        'https://raw.githubusercontent.com/java-native-access/jna/master/LICENSE.ASL')
sha1sums=('fcc5b10cb812c41b00708e7b57baccc3aee5567c'
          '1bc726a247a3fe718d411c802cd6215038d527a4')

package() {

  install -Dm775 "${srcdir}/jna-${pkgver}.jar" "${pkgdir}/usr/share/java/jna.jar"

  install -Dm755 "${srcdir}/LICENSE.ASL" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
