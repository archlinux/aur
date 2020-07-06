# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=rvrspkg
pkgver=1.7.3
pkgrel=1
pkgdesc="Creates a PKGBUILD for Arch Linux using the already installed package files"
arch=('any')
url="https://github.com/BiteDasher/rvrspkg"
license=('MIT')
depends=('bash' 'coreutils' 'sed')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/rvrspkg/archive/${pkgver}.tar.gz")
sha256sums=('82b15bd3efb170aa031537560361078e72f9674e552ba918712d2c9d5777d989')
package() {
mkdir -p $pkgdir/usr/bin
install -m 755 "$srcdir/$pkgname-$pkgver/rvrspkg" "$pkgdir/usr/bin/rvrspkg"
}
