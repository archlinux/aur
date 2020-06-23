# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=i3-cheat
pkgver=v1.0.0
_pkgver=1.0.0
pkgrel=1
pkgdesc="cheat sheet for i3wm"
arch=('any')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('GNU General Public License v3.0')
depends=('gtk3' 'i3-wm')
source=("https://github.com/TheCynicalTeam/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('a0a6d85bbf63c39ab48e6a92836beec75b8a6d069af3377dee088309a18eb067')

package() {
  cp -a $srcdir/$pkgname-$_pkgver-$pkgrel/etc $pkgdir/etc
  mkdir -p $pkgdir/usr/local
	cp -a $srcdir/$pkgname-$_pkgver-$pkgrel/usr/local/bin $pkgdir/usr/local/bin
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/$pkgname-$_pkgver-$pkgrel/usr/lib/i3-cheat $pkgdir/usr/lib/i3-cheat
}
