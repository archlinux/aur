# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=archbashstrap
pkgver=1.2.2
pkgrel=1
pkgdesc='Install/Bootstrap Arch Linux without pacman'
arch=('any')
url='https://github.com/BiteDasher/archbashstrap'
license=('BSD')
depends=('sed' 'coreutils' 'curl' 'tar')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/archbashstrap/archive/${pkgver}.tar.gz")
sha256sums=('5d19ae0b795e910e6c1e60c85b77a60d26f57f1ff8ae17709acbc79b32defd1e')
package() {
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/archbashstrap
install -m 755 "$srcdir/$pkgname-$pkgver/archbashstrap" "$pkgdir/usr/bin/archbashstrap"
install -m 655 "$srcdir/$pkgname-$pkgver/packages" "$pkgdir/usr/share/archbashstrap/packages"
}
