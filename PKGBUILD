# Maintainer: Alexander Görtz <aur@nyloc.de>
# Contributer: Ivan Abdulin <elbahek@gmail.com>

pkgname=xerial-sqlite-jdbc
pkgver=3.20.0
_fullname=sqlite-jdbc-${pkgver}
pkgrel=1
pkgdesc="Xerial implementation of SqliteJDBC"
arch=('i686' 'x86_64')
url="https://bitbucket.org/xerial/sqlite-jdbc"
license=('Apache')
depends=('java-runtime')
source=(https://bitbucket.org/xerial/sqlite-jdbc/downloads/${_fullname}.jar)
sha256sums=('143b1c0a453c9a8f77be14209ea15391d1e0eb93348fcfabf03cc227b0edae73')

package() {
  install -D -m644 \
    "$srcdir/${_fullname}.jar" \
    "$pkgdir/usr/share/java/${pkgname}/${_fullname}.jar"
  ln -s "${_fullname}.jar" "$pkgdir/usr/share/java/${pkgname}/${pkgname}.jar"
}
