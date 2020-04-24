# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=sakuri
pkgver=1.9.7
pkgrel=1
pkgdesc='Simple bash AUR helper'
arch=('any')
url='https://github.com/BiteDasher/sakuri'
license=('MIT')
depends=('bash' 'git' 'sudo' 'binutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/sakuri/archive/${pkgver}.tar.gz")
sha256sums=("cf6e5fbea052ce47de2496561da00e849b1cea92e065233e9ef9e9aa121d2dbd")
package() {
mkdir -p $pkgdir/usr/bin
cd "$srcdir/$pkgname-$pkgver"
msg2 "Note that all sakuri files are now stores in ~/.config/sakuridir"
msg2 "Now you can perform ALL operations with several packages at once"
install -m 755 sakuri "$pkgdir/usr/bin/sakuri"
}
