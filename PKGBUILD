# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-mirrorlist
pkgver=20221011
pkgrel=1
pkgdesc="ALHP mirror list for use by pacman"
arch=('any')
url="https://git.harting.dev/ALHP/alhp-mirrorlist"
license=('GPL')
backup=('etc/pacman.d/alhp-mirrorlist'
	'etc/pacman.d/alhp-mirrorlist.ipfs')
source=("https://git.harting.dev/ALHP/alhp-mirrorlist/archive/$pkgver.tar.gz")
b2sums=('965be95036f6e694d4b0b932e82ed7709ed21c87ca452e8c6d5e49a248b7afb9f106a5838460e78c574c242e982261a12a42368f799adcd6d5b85bf1f13a3689')

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m644 "$srcdir/alhp-mirrorlist/mirrorlist" "$pkgdir/etc/pacman.d/alhp-mirrorlist"
  install -m644 "$srcdir/alhp-mirrorlist/mirrorlist.ipfs" "$pkgdir/etc/pacman.d/alhp-mirrorlist.ipfs"
}
