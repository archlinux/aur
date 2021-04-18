# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=archbashstrap
pkgver=1.2.1
pkgrel=1
pkgdesc='Install/Bootstrap Arch Linux without pacman'
arch=('any')
url='https://github.com/BiteDasher/archbashstrap'
license=('BSD')
depends=('sed' 'coreutils' 'curl' 'tar')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/archbashstrap/archive/${pkgver}.tar.gz")
sha256sums=('473299bc75b053dae4bdb798d43dee5dfa4c500b574f66cd8b21d74d3e16be1c')
package() {
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/archbashstrap
install -m 755 "$srcdir/$pkgname-$pkgver/archbashstrap" "$pkgdir/usr/bin/archbashstrap"
install -m 655 "$srcdir/$pkgname-$pkgver/packages" "$pkgdir/usr/share/archbashstrap/packages"
}
