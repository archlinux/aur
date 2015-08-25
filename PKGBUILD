# Maintainer: Walter Dworak <preparationh67 at gmail dot com>
# Contributor: David Hajek <dante4d at gmail dot com>
# Contributor: Otto Allmendinger <otto dot allmendinger at gmail dot com>
# Contributor: Tom Burdick <thomas dot burdick at gmail dot com>
# see http://wiki.archlinux.org/index.php/Java_Package_Guidelines
pkgname=jgoodies-forms
pkgver=1.9.0
pkgrel=1
_pkgdate="20150202"
pkgdesc="A Java Swing form layout library"
arch=('any')
url="http://www.jgoodies.com/"
license=('BSD')
groups=('jgoodies')
depends=('jgoodies-common>=1.6.0')
optdepends=('java-runtime>=6')
source=("http://www.jgoodies.com/download/libraries/forms/$pkgname-${pkgver//./_}-$_pkgdate.zip")

md5sums=('958e721df514a629d2e3d06430bcefd7')
package() {
  _src="$srcdir/$pkgname-$pkgver"
  _pkg="$pkgdir/usr/share/java"
  install -m 644 -D "$_src/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  mkdir -p "$_pkg"
  mv "$_src" "$_pkg/$pkgname"
}

# vim:set ts=2 sw=2 et:
