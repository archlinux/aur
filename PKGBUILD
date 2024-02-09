pkgname=ifp-console
pkgver=0.0.1
pkgrel=1
pkgdesc="IFP | Infinite Fusion Project - console desktop app"
arch=('x86_64')
url="https://github.com/wxn0brP/ifp-console"
license=('MIT')
depends=()
makedepends=()
source=("https://github.com/wxn0brP/ifp-console/releases/download/v$pkgver/ifp-console")
sha256sums=('43841e6c0bc67f248c36ea759016a9088ddac20e126eae118b95a3f0c49628a5')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mv "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"
}

