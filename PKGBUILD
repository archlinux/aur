# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=sakuri
pkgver=1.9.8
pkgrel=1
pkgdesc='Simple bash AUR helper'
arch=('any')
url='https://github.com/BiteDasher/sakuri'
license=('MIT')
depends=('bash' 'git' 'sudo' 'binutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/sakuri/archive/${pkgver}.tar.gz")
sha256sums=("e8eab4063c2b0920fec7730b8a1f7da25779d8879f3d305054008e72e013cfaa")
package() {
mkdir -p $pkgdir/usr/bin
cd "$srcdir/$pkgname-$pkgver"
msg2 "Import dialog was added"
install -m 755 sakuri "$pkgdir/usr/bin/sakuri"
}
