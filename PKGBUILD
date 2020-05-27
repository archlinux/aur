# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=rvrspkg
pkgver=1.3
pkgrel=1
pkgdesc="Creates a package for Arch Linux using the installed package and its binary files"
arch=('any')
url="https://github.com/BiteDasher/rvrspkg"
license=('MIT')
depends=('bash' 'coreutils' 'sed')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/rvrspkg/archive/${pkgver}.tar.gz")
sha256sums=('47d69588ce30885dcd8da6b439fb3c074255a9ba3081131fd387a88e4ad5b34f')
package() {
mkdir -p $pkgdir/usr/bin
install -m 755 "$srcdir/$pkgname-$pkgver/rvrspkg" "$pkgdir/usr/bin/rvrspkg"
}
