# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=sakuri
pkgver=2.1.7
pkgrel=1
pkgdesc='Simple bash AUR helper'
arch=('any')
url='https://github.com/BiteDasher/sakuri'
license=('MIT')
depends=('jq' 'curl' 'bash' 'git' 'sudo' 'binutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/sakuri/archive/${pkgver}.tar.gz")
sha256sums=("5db1efe188ea81d2ec4d08b1dd27c4abc238ceb14cec71c6c072551907a9b16f")
package() {
mkdir -p $pkgdir/usr/bin
msg2 "More code fixes/cleanup; db.lock was added"
install -m 755 "$srcdir/$pkgname-$pkgver/sakuri" "$pkgdir/usr/bin/sakuri"
}
