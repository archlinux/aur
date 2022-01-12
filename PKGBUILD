# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-mirrorlist
pkgver=20220112
pkgrel=1
pkgdesc="ALHP mirror list for use by pacman"
arch=('any')
url="https://git.harting.dev/ALHP/alhp-mirrorlist"
license=('GPL')
backup=(etc/pacman.d/alhp-mirrorlist)
source=("https://git.harting.dev/ALHP/alhp-mirrorlist/archive/$pkgver.tar.gz")
b2sums=('59e0de015d39638ceb0f170144407adcdcb12cd94af17a87c9adfd812b3fd592c483e0bea0e6fd1771c37a368783078fae2fadb8735f8c90ad315f4a0d6d8ad7')

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m644 "$srcdir/alhp-mirrorlist/mirrorlist" "$pkgdir/etc/pacman.d/alhp-mirrorlist"
}
