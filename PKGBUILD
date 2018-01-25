# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=php-tcpdf
pkgver=6.2.13
pkgrel=1
pkgdesc="PHP library for generating PDF documents on-the-fly."
arch=("any")
url="https://tcpdf.org"
license=("GPL")
depends=("php")
provides=("php-tcpdf")
source=("$pkgname.tar.gz::https://github.com/tecnickcom/TCPDF/archive/"$pkgver".tar.gz")
md5sums=("36b65a265b1a88a2d19bbbe489b5f374")

package() {
  mkdir -p "$pkgdir/opt"
  cp -a "$srcdir/TCPDF-$pkgver" "$pkgdir/opt/$pkgname"
}
