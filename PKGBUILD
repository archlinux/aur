# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=sakuri
pkgver=2.2.3
pkgrel=1
pkgdesc='Simple bash AUR helper'
arch=('any')
url='https://github.com/BiteDasher/sakuri'
license=('MIT')
depends=('jq' 'curl' 'bash' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/sakuri/archive/${pkgver}.tar.gz")
sha256sums=("7e7d5658f80511f72bc66d97f7f1ea3d13975d1df2c4da6af75c00e4edaa1141")
package() {
mkdir -p $pkgdir/usr/bin
install -m 755 "$srcdir/$pkgname-$pkgver/sakuri" "$pkgdir/usr/bin/sakuri"
}
