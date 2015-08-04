# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
pkgname=sqlite-jdbc
pkgver=3.8.11.1
pkgrel=1
pkgdesc='JDBC driver for SQLite'
arch=('any')
url="https://bitbucket.org/xerial/sqlite-jdbc/"
license=('Apache')
depends=('java-runtime')
source=("https://bitbucket.org/xerial/sqlite-jdbc/downloads/sqlite-jdbc-${pkgver}.jar")
sha256sums=('58ab29176a24a85a0c76177561257a986c4865e45730b79882c688846371d341')

package() {
  install -D -m644 \
    $srcdir/$pkgname-$pkgver.jar \
    $pkgdir/usr/share/java/sqlite-jdbc/$pkgname-$pkgver.jar
  ln -s $pkgname-$pkgver.jar \
    $pkgdir/usr/share/java/sqlite-jdbc/sqlite-jdbc.jar
}
