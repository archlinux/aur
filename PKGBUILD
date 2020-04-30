# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=sakuri
pkgver=2.0.5
pkgrel=1
pkgdesc='Simple bash AUR helper'
arch=('any')
url='https://github.com/BiteDasher/sakuri'
license=('MIT')
depends=('jq' 'curl' 'bash' 'git' 'sudo' 'binutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/sakuri/archive/${pkgver}.tar.gz")
sha256sums=("d7b5d312e17f06149b396aed9877b0b517110aa25cc73b214f2dc602e35211b2")
package() {
mkdir -p $pkgdir/usr/bin
cd "$srcdir/$pkgname-$pkgver"
msg2 "New search function (taken from repofish)"
msg2 "Added epoch variable detect"
install -m 755 sakuri "$pkgdir/usr/bin/sakuri"
}
