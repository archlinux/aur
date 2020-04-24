# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=sakuri
pkgver=1.9.6
pkgrel=1
pkgdesc='Simple bash AUR helper'
arch=('any')
url='https://github.com/BiteDasher/sakuri'
license=('MIT')
depends=('bash' 'git' 'sudo' 'binutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/sakuri/archive/${pkgver}.tar.gz")
sha256sums=("b310436bc3bd8eece5fbdf3f8a0940a41c97a9139741a7bf8e839c4ec827fb42")
package() {
mkdir -p $pkgdir/usr/bin
cd "$srcdir/$pkgname-$pkgver"
msg2 "Note that all sakuri files are now stores in ~/.config/sakuridir"
msg2 "Now you can perform ALL operations with several packages at once"
install -m 755 sakuri "$pkgdir/usr/bin/sakuri"
}
