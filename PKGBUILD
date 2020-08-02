# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=pacadd
pkgver=1.0.3
pkgrel=1
pkgdesc="A simple tool for managing repositories"
arch=('any')
url='https://github.com/BiteDasher/pacadd'
license=('MIT')
depends=('bash' 'sed' 'coreutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/pacadd/archive/${pkgver}.tar.gz")
sha256sums=("0af2331ebf8dbffb6f7cf3b5249ba8cdc8e5f01d5102a32ec1c97f90daf51cfb")
package() {
mkdir -p $pkgdir/usr/bin
install -m 755 "$srcdir/$pkgname-$pkgver/pacadd" "$pkgdir/usr/bin/pacadd"
}
