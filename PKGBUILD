# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=php-tcpdf
pkgver=6.2.26
pkgrel=1
pkgdesc="PHP library for generating PDF documents on-the-fly."
arch=("any")
url="https://github.com/tecnickcom/TCPDF"
license=("GPL")
depends=("php")
provides=("php-tcpdf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=("be919ba997510f7d703b59de97d68195")

package() {
  install -d "$pkgdir/opt/$pkgname" && cp -a "$srcdir/TCPDF-$pkgver/." "$_"
}
