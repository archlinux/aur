# Maintainer: Walter Dworak <preparationh67@gmail.com>
# Contributor: David Hajek <dante4d at gmail dot com>
# see http://wiki.archlinux.org/index.php/Java_Package_Guidelines
pkgname=jgoodies-animation
pkgver=1.4.3
pkgrel=1
pkgdesc="A Java Swing animation library"
arch=('any')
url="http://www.jgoodies.com/"
license=('BSD')
groups=('jgoodies')
depends=('jgoodies-common>=1.5.0')
optdepends=('java-runtime>=6')
source=("http://www.jgoodies.com/download/libraries/animation/$pkgname-${pkgver//./_}.zip")

md5sums=('396a57df79ec6fabd205b0733f67539d')

package() {
  _src="$srcdir/$pkgname-$pkgver"
  _pkg="$pkgdir/usr/share/java"
  install -m 644 -D "$_src/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  mkdir -p "$_pkg"
  mv "$_src" "$_pkg/$pkgname"
}

# vim:set ts=2 sw=2 et:
