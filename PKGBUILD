# Maintainer: Angelo Haller <aur.archlinux@szanni.org>

pkgname=esh
pkgver=0.0.0
pkgrel=1
pkgdesc="embedded shell"
arch=('any')
url="http://szanni.org/esh"
license=('ISC')
source=($url/download/$pkgname-$pkgver.tar.xz)
sha256sums=('3287f2ed6a2177e2700e1111af68e983fbba44e3b8bd7eabd744e27b97b940ce')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install PREFIX="/usr" DESTDIR="$pkgdir/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
