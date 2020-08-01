# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=pacadd
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple tool for managing repositories"
arch=('any')
url='https://github.com/BiteDasher/pacadd'
license=('MIT')
depends=('bash' 'sed' 'coreutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/pacadd/archive/${pkgver}.tar.gz")
sha256sums=("f4b7b26e65d197892d7ce169faf3758a29bbebee9993ebab30d280992a5e0557")
package() {
mkdir -p $pkgdir/usr/bin
install -m 755 "$srcdir/$pkgname-$pkgver/pacadd" "$pkgdir/usr/bin/pacadd"
}
