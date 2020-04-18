# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=sakuri
pkgver=1.9.3
pkgrel=3
pkgdesc='Simple bash AUR helper'
arch=('any')
url='https://github.com/BiteDasher/sakuri'
license=('MIT')
depends=('bash' 'git' 'sudo' 'binutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/sakuri/archive/${pkgver}.tar.gz")
sha256sums=("b8a83037b8e8dcdd2c164540b35b0e3e5663f6ab2c4f20691227a8d204ad6e5c")
package() {
mkdir -p $pkgdir/usr/bin
cd "$srcdir/$pkgname-$pkgver"
install -m 755 sakuri "$pkgdir/usr/bin/sakuri"
}
