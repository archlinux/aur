pkgname=ifp
pkgver=0.0.34
pkgrel=1
pkgdesc="IFP | Infinite Fusion Project - electron desktop app"
arch=('x86_64')
url="https://github.com/wxn0brP/ifp-electron"
license=('MIT')
depends=()
makedepends=('npm')
source=("https://github.com/wxn0brP/ifp-electron/releases/download/v$pkgver/ifp-$pkgver.tar.gz")
sha256sums=('a1f1404cc42dff25391cc457ae17a82b4a1302cdbf07c58670c42379c900d798')

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -a ./* "$pkgdir/usr/lib/$pkgname"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

