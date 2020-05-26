# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=rvrspkg
pkgver=1.1
pkgrel=1
pkgdesc="Creates a package for Arch Linux using the installed package and its binary files"
arch=('any')
url="https://github.com/BiteDasher/rvrspkg"
license=('MIT')
depends=('bash' 'coreutils' 'pacman-contrib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/rvrspkg/archive/${pkgver}.tar.gz")
sha256sums=('276f076ca5bbc95b78688b10a6f4c3490b542dfc630467ccc306391fe99ea1b5')
package() {
mkdir -p $pkgdir/usr/bin
install -m 755 "$srcdir/$pkgname-$pkgver/rvrspkg" "$pkgdir/usr/bin/rvrspkg"
}
