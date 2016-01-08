# Submitter: David Hajek <dante4d at gmail dot com>
# Maintainer: Walter Dworak <preparationh67 at gmail dot com>
# see http://wiki.archlinux.org/index.php/Java_Package_Guidelines
pkgname=jgoodies-common
pkgver=1.7.0
pkgrel=1
_pkgver="1_7_0"
pkgdesc="A Java Swing common library required by other JGoodies libraries"
arch=('any')
url="http://www.jgoodies.com/"
license=('BSD')
groups=('jgoodies')
optdepends=('java-runtime>=6')
source=("http://www.jgoodies.com/download/libraries/common/$pkgname-$_pkgver.zip")

md5sums=('07380827ee9e345b35861bc3eed7d9b0')

package() {
  _src="$srcdir/$pkgname-$pkgver"
  _pkg="$pkgdir/usr/share/java"
  install -m 644 -D "$_src/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  mkdir -p "$_pkg"
  mv "$_src" "$_pkg/$pkgname"
}

# vim:set ts=2 sw=2 et:
