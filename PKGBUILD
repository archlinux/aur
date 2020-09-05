# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=php-tcpdf
pkgver=6.3.5
pkgrel=1
pkgdesc="PHP library for generating PDF documents on-the-fly"
arch=("any")
url="https://github.com/tecnickcom/TCPDF"
license=("GPL")
depends=("php")
provides=("php-tcpdf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=("f79daec0bbefd5693f93e89c4e848bdd")

package() {
  install -d "$pkgdir/opt/$pkgname" && cp -a "$srcdir/TCPDF-$pkgver/." "$_"
}
