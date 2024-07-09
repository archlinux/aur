# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=php-tcpdf
pkgver=6.7.5
pkgrel=1
pkgdesc="PHP library for generating PDF documents on-the-fly"
arch=("any")
url="https://github.com/tecnickcom/TCPDF"
license=("GPL")
depends=("php")
provides=("php-tcpdf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('f2b257b6ef0ebed0f42cfb93c95f4c6d')

package() {
  install -d "$pkgdir/opt/$pkgname" && cp -a "$srcdir/TCPDF-$pkgver/." "$_"
}
