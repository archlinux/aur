# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=pacadd
pkgver=1.0.4.1
pkgrel=1
pkgdesc="A simple tool for managing repositories"
arch=('any')
url='https://github.com/BiteDasher/pacadd'
license=('MIT')
depends=('bash' 'sed' 'coreutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/pacadd/archive/${pkgver}.tar.gz")
sha256sums=("88d357eaf9d0f0bb6f866e9f616e22014abe85475a73a59aa6010597267155d0")
package() {
mkdir -p $pkgdir/usr/bin
install -m 755 "$srcdir/$pkgname-$pkgver/pacadd" "$pkgdir/usr/bin/pacadd"
}
