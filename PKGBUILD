# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-mirrorlist
pkgver=20250825
pkgrel=2
pkgdesc='ALHP mirror list for use by pacman'
arch=(any)
url='https://somegit.dev/ALHP/alhp-mirrorlist'
license=(GPL-2.0-or-later)
backup=(
  'etc/pacman.d/alhp-mirrorlist'
  'etc/pacman.d/alhp-mirrorlist.ipfs'
)
makedepends=(git)
source=("git+$url#tag=$pkgver")
b2sums=('08b21778f2bbd704adf4c894e18ff34a69d26f2667454309205795540fb73383125b55e4f7adfb4f56a6e07696e34e65c5d2f9fa2da08ef4805f18f9c8882853')

package() {
  install -Dm644 alhp-mirrorlist/mirrorlist "$pkgdir"/etc/pacman.d/alhp-mirrorlist
  install -Dm644 alhp-mirrorlist/mirrorlist.ipfs "$pkgdir"/etc/pacman.d/alhp-mirrorlist.ipfs
}

# vim:set ts=2 sw=2 et:
