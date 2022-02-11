# Maintainer: MarkWalters.pw
pkgname=triehash
_srcver=0.3-3
pkgver=${_srcver//-/.}
pkgrel=1
pkgdesc='Generator for order-preserving minimal perfect hash functions in C'
arch=('any')
url='https://github.com/julian-klode/triehash'
license=('MIT')
depends=('perl')
source=("https://github.com/julian-klode/triehash/archive/debian/${_srcver}.tar.gz")
sha512sums=('ac766187d4eecc71cfcdaa39b2ab7af3c60760cf1be9bf02f4bb8ea242f291bd52b16d432693d1f071cb5163f7f0708213a7ac0653cff1da2dbf0f1459f2eb27')

package() {
  cd "$srcdir/$pkgname-debian-$_srcver"
  install -Dm755 "${pkgname}.pl" "$pkgdir/usr/bin/$pkgname"
}
