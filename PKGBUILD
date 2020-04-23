# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=sakuri
pkgver=1.9.5
pkgrel=1
pkgdesc='Simple bash AUR helper'
arch=('any')
url='https://github.com/BiteDasher/sakuri'
license=('MIT')
depends=('bash' 'git' 'sudo' 'binutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/sakuri/archive/${pkgver}.tar.gz")
sha256sums=("d2ff7773ab2ec4f983975c0555f1ae878669a28a437542fb290fed6d0c007d07")
package() {
mkdir -p $pkgdir/usr/bin
cd "$srcdir/$pkgname-$pkgver"
msg2 "Note that all sakuri files are now stores in ~/.config/sakuridir"
msg2 "Now you can install several packages at once"
install -m 755 sakuri "$pkgdir/usr/bin/sakuri"
}
