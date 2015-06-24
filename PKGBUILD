pkgname="gutbackup"
pkgver=3.0.2
pkgrel=1
url="https://github.com/gutenye/gutbackup"
pkgdesc="The simplest rsync wrapper for backup Linux system. PKGBUILD at https://github.com/gutenye/gutbackup/tree/master/misc/aur"
arch=("any")
license=("MIT")
depends=("rsync")
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/gutenye/gutbackup/archive/v$pkgver.tar.gz"
)
md5sums=('3fa76c7ddca1c274031da8e581a8e000')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./ake package "$pkgdir"
}

# vim:set ts=2 sw=2 et:
