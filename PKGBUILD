pkgname=sslsplit
pkgver=0.4.11
pkgrel=1
pkgdesc="SSLsplit is a tool for man-in-the-middle attacks against SSL/TLS encrypted network connections."
url="http://www.roe.ch/SSLsplit"
arch=('i686' 'x86_64')
license=('BSD')
source=("http://mirror.roe.ch/rel/$pkgname/$pkgname-$pkgver.tar.bz2")
sha512sums=('c3339b4d22eb8f94ad1bc161b2c2d9efcb2f2828985712a5580437077f4c0bd74657d42274c4a9118c92721b9bd1d8150cf83d89afef6144b20aba497ac1d69a')
package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX="$pkgdir/usr" install
}
