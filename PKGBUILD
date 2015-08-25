# Submitter: David Hajek <dante4d at gmail dot com>
# Maintainer: Walter Dworak <preparationh67 at gmail dot com>
# see http://wiki.archlinux.org/index.php/Java_Package_Guidelines
pkgname=jgoodies-common
pkgver=1.8.1
pkgrel=1
_pkgdate="20140629"
pkgdesc="A Java Swing common library required by other JGoodies libraries"
arch=('any')
url="http://www.jgoodies.com/"
license=('BSD')
groups=('jgoodies')
optdepends=('java-runtime>=6')
source=("http://www.jgoodies.com/download/libraries/common/$pkgname-${pkgver//./_}-$_pkgdate.zip")

md5sums=('24cc6aafe0bfe6b72d893caab6b38201')

package() {
  _src="$srcdir/$pkgname-$pkgver"
  _pkg="$pkgdir/usr/share/java"
  install -m 644 -D "$_src/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  mkdir -p "$_pkg"
  mv "$_src" "$_pkg/$pkgname"
}

# vim:set ts=2 sw=2 et:
