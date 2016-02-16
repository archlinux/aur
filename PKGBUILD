# Maintainer: Alexander Görtz <aur@nyloc.de>
# Contributer: Ivan Abdulin <elbahek@gmail.com>

pkgname=xerial-sqlite-jdbc
pkgver=3.8.11.2
_fullname=sqlite-jdbc-${pkgver}
pkgrel=1
pkgdesc="Xerial implementation of SqliteJDBC"
arch=('i686' 'x86_64')
url="https://bitbucket.org/xerial/sqlite-jdbc"
license=('Apache')
depends=('java-runtime')
source=(https://bitbucket.org/xerial/sqlite-jdbc/downloads/${_fullname}.jar)
sha256sums=('f30968b896af52baaeda4a901f6ef2629319168fa304e9747c7cfabef6c476ec')

package() {
  install -D -m644 \
    $srcdir/${_fullname}.jar \
    $pkgdir/usr/share/java/${pkgname}/${_fullname}.jar
  ln -s ${_fullname}.jar $pkgdir/usr/share/java/${pkgname}/${pkgname}.jar
}
