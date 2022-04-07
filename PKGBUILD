# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=php-tcpdf
pkgver=6.4.4
pkgrel=1
pkgdesc="PHP library for generating PDF documents on-the-fly"
arch=("any")
url="https://github.com/tecnickcom/TCPDF"
license=("GPL")
depends=("php")
provides=("php-tcpdf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('b1803bbae94c58327ce1649bf2464ddf')

package() {
  install -d "$pkgdir/opt/$pkgname" && cp -a "$srcdir/TCPDF-$pkgver/." "$_"
}
