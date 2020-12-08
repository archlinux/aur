# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=archbashstrap
pkgver=1.0
pkgrel=1
pkgdesc='Install/Bootstrap Arch Linux without pacman'
arch=('any')
url='https://github.com/BiteDasher/archbashstrap'
license=('BSD')
depends=('sed' 'coreutils' 'curl' 'tar')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/archbashstrap/archive/${pkgver}.tar.gz")
sha256sums=("de4a46651c1a6b0eaff3fa852a043fc2da4c4b1bd4c538321d2bdf3da2cbd221")
package() {
mkdir -p $pkgdir/usr/bin
install -m 755 "$srcdir/$pkgname-$pkgver/archbashstrap" "$pkgdir/usr/bin/archbashstrap"
}
