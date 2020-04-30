# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=sakuri
pkgver=2.0.9
pkgrel=1
pkgdesc='Simple bash AUR helper'
arch=('any')
url='https://github.com/BiteDasher/sakuri'
license=('MIT')
depends=('jq' 'curl' 'bash' 'git' 'sudo' 'binutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/sakuri/archive/${pkgver}.tar.gz")
sha256sums=("d23338c3f4efe0c3f376a03660ce00360ff06c7c248d4784252e418d1e11b9d3")
package() {
mkdir -p $pkgdir/usr/bin
cd "$srcdir/$pkgname-$pkgver"
msg2 "Improved ignore list function"
msg2 "Fixes of i) and ia) functions"
install -m 755 sakuri "$pkgdir/usr/bin/sakuri"
}
