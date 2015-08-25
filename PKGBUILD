# Maintainer: Walter Dworak <preparationh67 at gmail dot com>
# Contributor: David Hajek <dante4d at gmail dot com>
# see http://wiki.archlinux.org/index.php/Java_Package_Guidelines
pkgname=jgoodies-validation
pkgver=2.5.1
pkgrel=1
_pkgdate="20141229"
pkgdesc="A Java Swing validation library"
arch=('any')
url="http://www.jgoodies.com/"
license=('BSD')
groups=('jgoodies')
depends=('jgoodies-common>=1.5.0')
optdepends=('java-runtime>=6')
source=("http://www.jgoodies.com/download/libraries/validation/$pkgname-${pkgver//./_}-$_pkgdate.zip")

md5sums=('70aae66acf290a6072a1bddddce0f053')

package() {
  _src="$srcdir/$pkgname-$pkgver"
  _pkg="$pkgdir/usr/share/java"
  install -m 644 -D "$_src/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  mkdir -p "$_pkg"
  mv "$_src" "$_pkg/$pkgname"
}

# vim:set ts=2 sw=2 et:
