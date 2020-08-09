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
sha256sums=('1bdfd110650887c90636051c9cf64c4a22336cbd129981693ca9084bf9bd55f6')

package() {
  cp -a $srcdir/$pkgname-$pkgver-$pkgrel/etc $pkgdir/etc
  mkdir -p $pkgdir/usr
	cp -a $srcdir/$pkgname-$pkgver-$pkgrel/usr/bin $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/$pkgname-$pkgver-$pkgrel/usr/lib/multimonitorlock-gui $pkgdir/usr/lib/multimonitorlock-gui
}
