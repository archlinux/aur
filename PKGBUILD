# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=multimonitorlock-gui
pkgver=2021.01.02
pkgrel=1
pkgdesc='GUI for multimonitorlock to set the background using QT6 and pyside6'
arch=('any')
groups=('therepoclub')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('CC BY-NC-SA 4.0')
depends=('pyside6' 'multimonitorlock' 'gtk-engine-murrine')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('09ce7f24e69a2ac1952854fdb08fe4f1400f6af8837e717f98856c9c107f682f')

package() {
  cp -a $srcdir/$pkgname-$pkgver/etc $pkgdir/etc
  mkdir -p $pkgdir/usr
	cp -a $srcdir/$pkgname-$pkgver/usr/bin $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/$pkgname-$pkgver/usr/lib/multimonitorlock-gui $pkgdir/usr/lib/multimonitorlock-gui
}
