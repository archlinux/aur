# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=qt-logout
pkgver=1.0.2
pkgrel=1
pkgdesc='Logout script for qt5'
arch=('any')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('GNU General Public License v3.0')
depends=('python-pyqt5' 'multilockscreen' 'gtk-engine-murrine')
conflicts=('multilockscreen-git' 'betterlockscreen' 'betterlockscreen-git')
source=("https://github.com/TheCynicalTeam/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('71849cb95a1c68476aaebb02b1d6cf0f7526eebad0fb67299fbdfa20b463096b')

package() {
  cp -a $srcdir/$pkgname-$pkgver-$pkgrel/etc $pkgdir/etc
  mkdir -p $pkgdir/usr/local
	cp -a $srcdir/$pkgname-$pkgver-$pkgrel/usr/local/bin $pkgdir/usr/local/bin
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/$pkgname-$pkgver-$pkgrel/usr/lib/qt-logout $pkgdir/usr/lib/qt-logout
}
