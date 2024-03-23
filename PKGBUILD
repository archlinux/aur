# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-mirrorlist
pkgver=20240208
pkgrel=1
pkgdesc='ALHP mirror list for use by pacman'
arch=(any)
url='https://somegit.dev/ALHP/alhp-mirrorlist'
license=(GPL-2.0-or-later)
backup=(
  'etc/pacman.d/alhp-mirrorlist'
  'etc/pacman.d/alhp-mirrorlist.ipfs'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('8c5ddadcb347db28bffffcadf35ad15b25de0e9aa9ca7e4f192d4b840a2f13ff931d62bc84cff5c4db3db11c0e2e5e815c113ab40a78c19df411a577cd76f7fc')

package() {
  install -Dm644 alhp-mirrorlist/mirrorlist "$pkgdir"/etc/pacman.d/alhp-mirrorlist
  install -Dm644 alhp-mirrorlist/mirrorlist.ipfs "$pkgdir"/etc/pacman.d/alhp-mirrorlist.ipfs
}

# vim:set ts=2 sw=2 et:
