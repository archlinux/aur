# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=multimonitorlock-gui
pkgver=2021.01.01
pkgrel=1
pkgdesc='GUI for multimonitorlock to set the background'
arch=('any')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('CC BY-NC-SA 4.0')
depends=('python-pyqt5' 'multimonitorlock' 'gtk-engine-murrine')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('e086ce592e78a154a0eca2157026b9a82bd2cd778e2ac8b588c44b43960c4501')

package() {
  cp -a $srcdir/$pkgname-$pkgver/etc $pkgdir/etc
  mkdir -p $pkgdir/usr
	cp -a $srcdir/$pkgname-$pkgver/usr/bin $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/$pkgname-$pkgver/usr/lib/multimonitorlock-gui $pkgdir/usr/lib/multimonitorlock-gui
}
