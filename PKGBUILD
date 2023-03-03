# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-mirrorlist
pkgver=20230303
pkgrel=1
pkgdesc="ALHP mirror list for use by pacman"
arch=('any')
url="https://somegit.dev/ALHP/alhp-mirrorlist"
license=('GPL')
backup=('etc/pacman.d/alhp-mirrorlist'
	'etc/pacman.d/alhp-mirrorlist.ipfs')
source=("https://somegit.dev/ALHP/alhp-mirrorlist/archive/$pkgver.tar.gz")
b2sums=('c5b5400d078fa7416da169b59103819cf3b1f534cde69279f547af2423e72fb5384898e83dab62a3291494ea6f5f087f772723b935ce5c5a73e0d4b81818d916')

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m644 "$srcdir/alhp-mirrorlist/mirrorlist" "$pkgdir/etc/pacman.d/alhp-mirrorlist"
  install -m644 "$srcdir/alhp-mirrorlist/mirrorlist.ipfs" "$pkgdir/etc/pacman.d/alhp-mirrorlist.ipfs"
}
