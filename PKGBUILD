# Maintainer: Alexander Görtz <aur@nyloc.de>
# Contributer: Ivan Abdulin <elbahek@gmail.com>

pkgname=xerial-sqlite-jdbc
pkgver=3.16.1
_fullname=sqlite-jdbc-${pkgver}
pkgrel=1
pkgdesc="Xerial implementation of SqliteJDBC"
arch=('i686' 'x86_64')
url="https://bitbucket.org/xerial/sqlite-jdbc"
license=('Apache')
depends=('java-runtime')
source=(https://bitbucket.org/xerial/sqlite-jdbc/downloads/${_fullname}.jar)
sha256sums=('211a0cb1694e53b7a120034ee33bd7b719bc7d0f5b619af2be26f2e5fb66e763')

package() {
  install -D -m644 \
    $srcdir/${_fullname}.jar \
    $pkgdir/usr/share/java/${pkgname}/${_fullname}.jar
  ln -s ${_fullname}.jar $pkgdir/usr/share/java/${pkgname}/${pkgname}.jar
}
