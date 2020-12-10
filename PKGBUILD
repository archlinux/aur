# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Contributor: David Hajek <dante4d at gmail dot com>
# Contributor: Geoffroy Carrier <geoffroy dot carrier at koon dot fr>
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname=jgoodies-looks
pkgver=2.5.3
pkgrel=1
pkgdesc="A Java Swing look and feel library"
arch=('any')
url="http://www.jgoodies.com"
license=('BSD')
depends=('java-runtime')
source=("$url/download/libraries/looks/$pkgname-${pkgver//./_}.zip")
sha256sums=('a4a61f5d5474e048c12d602dc899f2bcf7b41604d5704880eb5af14b4938c588')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  install -Dm644 $pkgname-$pkgver.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
}
