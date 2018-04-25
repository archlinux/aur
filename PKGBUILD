# Maintainer: Vladimir Tsanev <tsachev@gmail.com>

pkgname=jcommander
pkgver=1.72
pkgrel=3
pkgdesc="Command line parsing framework for Java"
arch=('any')
url="http://jcommander.org/"
license=('Apache')
depends=('java-runtime')
source=("https://repo.maven.apache.org/maven2/com/beust/${pkgname}/${pkgver}/${pkgname}-${pkgver}.jar")
noextract=("${pkgname}-${pkgver}.jar")
sha1sums=('6375e521c1e11d6563d4f25a07ce124ccf8cd171')

package() {
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar
  ln -sf ${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
}
