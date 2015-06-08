# Maintainer: Alexander Görtz <aur@nyloc.de>
# Contributer: Ivan Abdulin <elbahek@gmail.com>

pkgname=xerial-sqlite-jdbc
pkgver=3.8.10.1
_fullname=sqlite-jdbc-${pkgver}
pkgrel=1
pkgdesc="Xerial implementation of SqliteJDBC"
arch=('i686' 'x86_64')
url="https://bitbucket.org/xerial/sqlite-jdbc"
license=('Apache')
depends=('java-runtime')
source=(https://bitbucket.org/xerial/sqlite-jdbc/downloads/${_fullname}.jar)
sha256sums=('70690f566a5ca2fdc0ccbef8623209cd67c4ee151291800f35ad9a0b7ab72be7')

package() {
  install -D -m644 \
    $srcdir/${_fullname}.jar \
    $pkgdir/usr/share/java/${pkgname}/${_fullname}.jar
  ln -s ${_fullname}.jar $pkgdir/usr/share/java/${pkgname}/${pkgname}.jar
}
