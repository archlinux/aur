# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-mirrorlist
pkgver=20220923
pkgrel=1
pkgdesc="ALHP mirror list for use by pacman"
arch=('any')
url="https://git.harting.dev/ALHP/alhp-mirrorlist"
license=('GPL')
backup=('etc/pacman.d/alhp-mirrorlist'
	'etc/pacman.d/alhp-mirrorlist.ipfs')
source=("https://git.harting.dev/ALHP/alhp-mirrorlist/archive/$pkgver.tar.gz")
b2sums=('08190a6279096ec2ae453ff37e2675d5cc44c7619f4579844c5a8fc8cb6fe4cea0e189445c390256f56c906276e2c783f7a7a44960a6a403def0c5b47017f8ea')

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m644 "$srcdir/alhp-mirrorlist/mirrorlist" "$pkgdir/etc/pacman.d/alhp-mirrorlist"
  install -m644 "$srcdir/alhp-mirrorlist/mirrorlist.ipfs" "$pkgdir/etc/pacman.d/alhp-mirrorlist.ipfs"
}
