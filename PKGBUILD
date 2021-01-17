# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=sakuri
pkgver=2.4.1
pkgrel=1
pkgdesc='Simple bash AUR helper'
arch=('any')
url='https://github.com/BiteDasher/sakuri'
license=('MIT')
depends=('jq' 'curl' 'bash' 'git' 'sed')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/sakuri/archive/${pkgver}.tar.gz")
sha256sums=("3f0d2d2fb8ac32ec7a3cb363510d108529ecff71567d60e12392479e369f89c5")
package() {
mkdir -p $pkgdir/usr/bin
install -m 755 "$srcdir/$pkgname-$pkgver/sakuri" "$pkgdir/usr/bin/sakuri"
}
