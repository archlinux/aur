# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=pacadd
pkgver=1.0.2
pkgrel=1
pkgdesc="A simple tool for managing repositories"
arch=('any')
url='https://github.com/BiteDasher/pacadd'
license=('MIT')
depends=('bash' 'sed' 'coreutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/pacadd/archive/${pkgver}.tar.gz")
sha256sums=("4b02ae55401022b0690184c7e87777cde9a4f45df5d2be232e55b04c5370c7bc")
package() {
mkdir -p $pkgdir/usr/bin
install -m 755 "$srcdir/$pkgname-$pkgver/pacadd" "$pkgdir/usr/bin/pacadd"
}
