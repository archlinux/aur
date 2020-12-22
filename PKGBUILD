# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=archbashstrap
pkgver=1.2
pkgrel=1
pkgdesc='Install/Bootstrap Arch Linux without pacman'
arch=('any')
url='https://github.com/BiteDasher/archbashstrap'
license=('BSD')
depends=('sed' 'coreutils' 'curl' 'tar')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/archbashstrap/archive/${pkgver}.tar.gz")
sha256sums=("eb205490b23b95a4d82ad19238d2c0077eb44b7da4c44fe23a4aee8d5d5d6078")
package() {
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/archbashstrap
install -m 755 "$srcdir/$pkgname-$pkgver/archbashstrap" "$pkgdir/usr/bin/archbashstrap"
install -m 655 "$srcdir/$pkgname-$pkgver/packages" "$pkgdir/usr/share/archbashstrap/packages"
}
