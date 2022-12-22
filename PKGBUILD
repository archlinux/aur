# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-mirrorlist
pkgver=20221222
pkgrel=1
pkgdesc="ALHP mirror list for use by pacman"
arch=('any')
url="https://git.harting.dev/ALHP/alhp-mirrorlist"
license=('GPL')
backup=('etc/pacman.d/alhp-mirrorlist'
	'etc/pacman.d/alhp-mirrorlist.ipfs')
source=("https://git.harting.dev/ALHP/alhp-mirrorlist/archive/$pkgver.tar.gz")
b2sums=('4e943fe42f3d946d8e209b2907a7c8c8deeaaa1499225ae7b01f1f84f33de80665436761f66dd720550391fe3ed565be5250ac3ac53c90d89008681fac43c791')

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m644 "$srcdir/alhp-mirrorlist/mirrorlist" "$pkgdir/etc/pacman.d/alhp-mirrorlist"
  install -m644 "$srcdir/alhp-mirrorlist/mirrorlist.ipfs" "$pkgdir/etc/pacman.d/alhp-mirrorlist.ipfs"
}
