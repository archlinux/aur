# Maintainer: TheGoliath
# Contributor: TheGoliath
pkgname=triehash
pkgver=0.3
pkgrel=2
pkgdesc="Generator for order-preserving minimal perfect hash functions in C"
arch=('any')
url="https://github.com/julian-klode/triehash"
license=('MIT')
groups=('')
depends=('perl')
source=("https://github.com/julian-klode/triehash/archive/v${pkgver}.tar.gz")
sha512sums=('6a9591dc095cce36777275c1886c844c447e69d5b2ea705b258ca30ec6ea1075f14e293852924edd30c94505bd7bccd7f4c60173e10ec7e70dbddf9700b8bef7')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "${pkgname}.pl" "$pkgdir/usr/bin/$pkgname"
}
