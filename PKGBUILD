# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=sakuri
pkgver=2.2.9
pkgrel=1
pkgdesc='Simple bash AUR helper'
arch=('any')
url='https://github.com/BiteDasher/sakuri'
license=('MIT')
depends=('jq' 'curl' 'bash' 'git' 'sed')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/sakuri/archive/${pkgver}.tar.gz")
sha256sums=("e7a0ded99797aa46d500401d2e648b7b327d12189c4a2e9afd307d38efc62e40")
package() {
mkdir -p $pkgdir/usr/bin
install -m 755 "$srcdir/$pkgname-$pkgver/sakuri" "$pkgdir/usr/bin/sakuri"
}
