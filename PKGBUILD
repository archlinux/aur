# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
_pkgname=wm-cheat
pkgname=i3-cheat
pkgver=2021.01.17
pkgrel=1
pkgdesc="cheat sheet for i3wm"
arch=('any')
url="https://github.com/TheCynicalTeam/$_pkgname"
license=('CC BY-NC-SA 4.0')
depends=('gtk3' 'i3-wm')
source=("${_pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('3d37b3d7b672dba63ca581e80f64eca4c91399be569d551b11ae1b90e0aee82d')

package() {
  mkdir -p $pkgdir/etc
  cp -a $srcdir/$_pkgname-$pkgver/etc/i3-cheat.conf $pkgdir/etc/i3-cheat.conf
  mkdir -p $pkgdir/usr/bin/
  cp -a $srcdir/$_pkgname-$pkgver/usr/bin/i3-cheat $pkgdir/usr/bin/i3-cheat
  mkdir -p $pkgdir/usr/lib
  cp -a $srcdir/$_pkgname-$pkgver/usr/lib/wm-cheat $pkgdir/usr/lib/wm-cheat
}
