# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-mirrorlist
pkgver=20260324
pkgrel=1
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
b2sums=('93a64d29e4c427850e172a6165ebdaace9c82a1e62bd7deb00f16a145c99c63cbb72fa57aa5bc4e404efb9585904db63a3be2cbaf96bf4f58aaff8a71d75d49a')

package() {
  install -Dm644 alhp-mirrorlist/mirrorlist "$pkgdir"/etc/pacman.d/alhp-mirrorlist
  install -Dm644 alhp-mirrorlist/mirrorlist.ipfs "$pkgdir"/etc/pacman.d/alhp-mirrorlist.ipfs
}

# vim:set ts=2 sw=2 et:
