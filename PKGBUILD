# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=sakuri
pkgver=2.0.4
pkgrel=1
pkgdesc='Simple bash AUR helper'
arch=('any')
url='https://github.com/BiteDasher/sakuri'
license=('MIT')
depends=('bash' 'git' 'sudo' 'binutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/sakuri/archive/${pkgver}.tar.gz")
sha256sums=("c512f9c7b2617f164a8d282e3aa27259929fc84280bedd9a9ac8d1d49b4dca95")
package() {
mkdir -p $pkgdir/usr/bin
cd "$srcdir/$pkgname-$pkgver"
msg2 "(no) Latest version(as I think)"
msg2 "New search function (taken from repofish)"
install -m 755 sakuri "$pkgdir/usr/bin/sakuri"
}
