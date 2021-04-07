# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=multimonitorlock-gui
pkgver=2021.04.07
pkgrel=1
pkgdesc='GUI for multimonitorlock to set the background using QT6 and pyside6'
arch=('any')
groups=('therepoclub')
url="https://github.com/The-Repo-Club/$pkgname"
license=('CC BY-NC-SA 4.0')
depends=('pyside2' 'multimonitorlock')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('3ca6a11fcb97da2dd5e4b5ef8491d614baeee93324825f86c3d0f34ccdf07755')

package() {
  cp -a $srcdir/$pkgname-$pkgver/etc $pkgdir/etc
  mkdir -p $pkgdir/usr
	cp -a $srcdir/$pkgname-$pkgver/usr/bin $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/$pkgname-$pkgver/usr/lib/multimonitorlock-gui $pkgdir/usr/lib/multimonitorlock-gui
}
