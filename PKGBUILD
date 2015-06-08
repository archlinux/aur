# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
pkgname=sqlite-jdbc
pkgver=3.8.10.1
pkgrel=1
pkgdesc='JDBC driver for SQLite'
arch=('any')
url="https://bitbucket.org/xerial/sqlite-jdbc/"
license=('Apache')
depends=('java-runtime')
source=("https://bitbucket.org/xerial/sqlite-jdbc/downloads/sqlite-jdbc-${pkgver}.jar")
sha256sums=('70690f566a5ca2fdc0ccbef8623209cd67c4ee151291800f35ad9a0b7ab72be7')

package() {
  install -D -m644 \
    $srcdir/$pkgname-$pkgver.jar \
    $pkgdir/usr/share/java/sqlite-jdbc/$pkgname-$pkgver.jar
  ln -s $pkgname-$pkgver.jar \
    $pkgdir/usr/share/java/sqlite-jdbc/sqlite-jdbc.jar
}
