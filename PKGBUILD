# Submitter: David Hajek <dante4d at gmail dot com>
# Maintainer: Walter Dworak <preparationh67 at gmail dot com>
# see http://wiki.archlinux.org/index.php/Java_Package_Guidelines
pkgname=jgoodies-binding
pkgver=2.13.0
pkgrel=1
_pkgdate="20150121"
pkgdesc="A Java Swing binding library"
arch=('any')
url="http://www.jgoodies.com/"
license=('BSD')
groups=('jgoodies')
depends=('jgoodies-common>=1.8.0')
optdepends=('java-runtime>=6')
source=("http://www.jgoodies.com/download/libraries/binding/$pkgname-${pkgver//./_}-$_pkgdate.zip")

md5sums=('d4c3e8dd2699faf52fa5e725f89d3893')

package() {
  _src="$srcdir/$pkgname-$pkgver"
  _pkg="$pkgdir/usr/share/java"
  install -m 644 -D "$_src/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  mkdir -p $_pkg
  mv "$_src" "$_pkg/$pkgname"
}

# vim:set ts=2 sw=2 et:
