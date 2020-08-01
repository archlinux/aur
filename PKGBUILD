# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=pacadd
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple tool for managing repositories"
arch=('any')
url='https://github.com/BiteDasher/pacadd'
license=('MIT')
depends=('bash' 'sed' 'coreutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/pacadd/archive/${pkgver}.tar.gz")
sha256sums=("3c9629ab0e0c61d2c57b32e87cac384426a3eb636328a46ecf6e3ed0ddd85abb")
package() {
mkdir -p $pkgdir/usr/bin
install -m 755 "$srcdir/$pkgname-$pkgver/pacadd" "$pkgdir/usr/bin/pacadd"
}
