# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=rvrspkg
pkgver=1.4.1
pkgrel=1
pkgdesc="Creates a PKGBUILD for Arch Linux using the already installed package files"
arch=('any')
url="https://github.com/BiteDasher/rvrspkg"
license=('MIT')
depends=('bash' 'coreutils' 'sed')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/rvrspkg/archive/${pkgver}.tar.gz")
sha256sums=('84a6937ecdad5e54835206d568d8ccaea3a3c204e054a148fff69f1863a6a28a')
package() {
mkdir -p $pkgdir/usr/bin
install -m 755 "$srcdir/$pkgname-$pkgver/rvrspkg" "$pkgdir/usr/bin/rvrspkg"
}
