# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=sakuri
pkgver=2.0.8
pkgrel=1
pkgdesc='Simple bash AUR helper'
arch=('any')
url='https://github.com/BiteDasher/sakuri'
license=('MIT')
depends=('jq' 'curl' 'bash' 'git' 'sudo' 'binutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/sakuri/archive/${pkgver}.tar.gz")
sha256sums=("f45218e842302b40edf5c895f58e438164b1c19c465c63ea728c4f1ebf1a8491")
package() {
mkdir -p $pkgdir/usr/bin
cd "$srcdir/$pkgname-$pkgver"
msg2 "Added epoch variable detect"
msg2 "Improved AUR dependencies"
msg2 "Improved ignore list function"
install -m 755 sakuri "$pkgdir/usr/bin/sakuri"
}
