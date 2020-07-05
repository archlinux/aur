# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=rvrspkg
pkgver=1.7
pkgrel=1
pkgdesc="Creates a PKGBUILD for Arch Linux using the already installed package files"
arch=('any')
url="https://github.com/BiteDasher/rvrspkg"
license=('MIT')
depends=('bash' 'coreutils' 'sed')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/rvrspkg/archive/${pkgver}.tar.gz")
sha256sums=('ed1d202dd3ea51aa57427db2fa861edff69940b93a4bbd0d121a3e24ec65aef2')
package() {
mkdir -p $pkgdir/usr/bin
install -m 755 "$srcdir/$pkgname-$pkgver/rvrspkg" "$pkgdir/usr/bin/rvrspkg"
}
