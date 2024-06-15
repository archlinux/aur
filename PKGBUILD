# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-mirrorlist
pkgver=20240615
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
b2sums=('181a3d7c71fe37eb25c560b3e8d4cb29e96b105781bb007799d7e117e8bde9ced7c58024ef0e4947ee5e4cc347c40595a867f79c1d03c186e6fa53198b66631d')

package() {
  install -Dm644 alhp-mirrorlist/mirrorlist "$pkgdir"/etc/pacman.d/alhp-mirrorlist
  install -Dm644 alhp-mirrorlist/mirrorlist.ipfs "$pkgdir"/etc/pacman.d/alhp-mirrorlist.ipfs
}

# vim:set ts=2 sw=2 et:
