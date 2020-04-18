# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=sakuri
pkgver=1.9.3
pkgrel=2
pkgdesc='Simple bash AUR helper'
arch=('any')
url='https://github.com/BiteDasher/sakuri'
license=('MIT')
depends=('bash' 'git' 'sudo' 'binutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/sakuri/archive/${pkgver}.tar.gz")
sha256sums=("f51529e8e901d80497d34c4f9b2ccfd4775095d6df315d8283f0b995ef8180e2")
package() {
mkdir -p $pkgdir/usr/bin
cd "$srcdir/$pkgname-$pkgver"
install -m 755 sakuri "$pkgdir/usr/bin/sakuri"
}
