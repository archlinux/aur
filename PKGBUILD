# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-mirrorlist
pkgver=20230831
pkgrel=1
pkgdesc="ALHP mirror list for use by pacman"
arch=('any')
url="https://somegit.dev/ALHP/alhp-mirrorlist"
license=('GPL')
backup=('etc/pacman.d/alhp-mirrorlist'
	'etc/pacman.d/alhp-mirrorlist.ipfs')
source=("https://somegit.dev/ALHP/alhp-mirrorlist/archive/$pkgver.tar.gz")
b2sums=('b99cb6078f6bae60849df9b639ce8e25eb73832882c1880859cf599c2dc8a715b4afd6b45a677b4a114074d4c94099e0be4dfffffcec8aa159bc539da151497f')

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m644 "$srcdir/alhp-mirrorlist/mirrorlist" "$pkgdir/etc/pacman.d/alhp-mirrorlist"
  install -m644 "$srcdir/alhp-mirrorlist/mirrorlist.ipfs" "$pkgdir/etc/pacman.d/alhp-mirrorlist.ipfs"
}
