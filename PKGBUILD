# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=php-tcpdf
pkgver=6.11.3
pkgrel=1
pkgdesc="PHP library for generating PDF documents on-the-fly"
arch=("any")
url="https://github.com/tecnickcom/TCPDF"
license=("GPL")
depends=("php")
provides=("php-tcpdf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('b6f6f758736aad0b7e20e9a0942027ef')

package() {
  install -d "$pkgdir/opt/$pkgname" && cp -a "$srcdir/TCPDF-$pkgver/." "$_"
}
