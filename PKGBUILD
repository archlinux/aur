# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=multimonitorlock-gui
pkgver=2020.7.9
pkgrel=1
pkgdesc='GUI for multimonitorlock to set the background'
arch=('any')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('GNU General Public License v3.0')
depends=('python-pyqt5' 'multimonitorlock' 'gtk-engine-murrine')
source=("https://github.com/TheCynicalTeam/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('5f30f85115cd8d1970ff1b6ff1b540a809edb205a6e7deb24ed5b9746f641696')

package() {
  cp -a $srcdir/$pkgname-$pkgver-$pkgrel/etc $pkgdir/etc
  mkdir -p $pkgdir/usr
	cp -a $srcdir/$pkgname-$pkgver-$pkgrel/usr/bin $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/$pkgname-$pkgver-$pkgrel/usr/lib/multimonitorlock-gui $pkgdir/usr/lib/multimonitorlock-gui
}
