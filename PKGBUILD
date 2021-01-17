# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=i3-cheat
pkgver=2021.01.01
pkgrel=1
pkgdesc="cheat sheet for i3wm"
arch=('any')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('CC BY-NC-SA 4.0')
depends=('gtk3' 'i3-wm')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('e77e351c856f6594a17e583cded8bf75fe1bc4dd3ddd6babd2f7b24d83b98fba')

package() {
  cp -a $srcdir/$pkgname-$pkgver/etc $pkgdir/etc
  mkdir -p $pkgdir/usr
  cp -a $srcdir/$pkgname-$pkgver/usr/bin $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
  cp -a $srcdir/$pkgname-$pkgver/usr/lib/i3-cheat $pkgdir/usr/lib/i3-cheat
}
