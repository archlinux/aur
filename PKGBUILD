# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=sakuri
pkgver=2.2.0
pkgrel=1
pkgdesc='Simple bash AUR helper'
arch=('any')
url='https://github.com/BiteDasher/sakuri'
license=('MIT')
depends=('jq' 'curl' 'bash' 'git' 'binutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/sakuri/archive/${pkgver}.tar.gz")
sha256sums=("eb2c7b6509089872417d9a7493bb731d5af66d6d4e3b5fad1bbf5f98bae29dc1")
package() {
mkdir -p $pkgdir/usr/bin
msg2 "More code fixes/cleanup; db.lock was fixed"
install -m 755 "$srcdir/$pkgname-$pkgver/sakuri" "$pkgdir/usr/bin/sakuri"
}
