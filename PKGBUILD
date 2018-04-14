# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=php-tcpdf
pkgver=6.2.17
pkgrel=1
pkgdesc="PHP library for generating PDF documents on-the-fly."
arch=("any")
url="https://tcpdf.org"
license=("GPL")
depends=("php")
provides=("php-tcpdf")
source=("$pkgname-$pkgver::https://github.com/tecnickcom/TCPDF/archive/"$pkgver".tar.gz")
md5sums=("487fd5ef3e99e014f9be95bc099036f0")

package() {
  mkdir -p "$pkgdir/opt"
  cp -a "$srcdir/TCPDF-$pkgver" "$pkgdir/opt/$pkgname"
}
