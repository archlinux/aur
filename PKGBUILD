# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-mirrorlist
pkgver=20240207
pkgrel=1
pkgdesc="ALHP mirror list for use by pacman"
arch=(any)
url="https://somegit.dev/ALHP/alhp-mirrorlist"
license=(GPL)
backup=(
  "etc/pacman.d/alhp-mirrorlist"
  "etc/pacman.d/alhp-mirrorlist.ipfs"
)
source=("https://somegit.dev/ALHP/alhp-mirrorlist/archive/$pkgver.tar.gz")
b2sums=('5544683ef6fa4d7f23c7a8d177518d8b33c219c1eef389399743e198210a76a5800ace981f30ae9ee61a60ca22496dbcc101ccf60ac4499e1e7b4f5170cd350e')

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m644 "$srcdir/alhp-mirrorlist/mirrorlist" "$pkgdir/etc/pacman.d/alhp-mirrorlist"
  install -m644 "$srcdir/alhp-mirrorlist/mirrorlist.ipfs" "$pkgdir/etc/pacman.d/alhp-mirrorlist.ipfs"
}

# vim:set ts=2 sw=2 et:
