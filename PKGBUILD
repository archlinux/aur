# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=archbashstrap
pkgver=1.2.3
pkgrel=1
pkgdesc='Install/Bootstrap Arch Linux without pacman'
arch=('any')
url='https://github.com/BiteDasher/archbashstrap'
license=('BSD')
depends=('sed' 'coreutils' 'curl' 'tar')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/archbashstrap/archive/${pkgver}.tar.gz")
sha256sums=('0817a89c5fe56a3b49c5f92703b55aa97003ce4473c846f7075c2757b23b5f7c')
package() {
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/archbashstrap
install -m 755 "$srcdir/$pkgname-$pkgver/archbashstrap" "$pkgdir/usr/bin/archbashstrap"
install -m 655 "$srcdir/$pkgname-$pkgver/packages" "$pkgdir/usr/share/archbashstrap/packages"
}
