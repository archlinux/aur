# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-mirrorlist
pkgver=20241215
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
b2sums=('4e1972517b13febd5369eb574e87b571199480f46cb62f9cbd93a46a28a9db2ff46b3cf719ecb4d2edd5a57d8afd42a9e984a6b560cd739f808fdbb4aaf045e8')

package() {
  install -Dm644 alhp-mirrorlist/mirrorlist "$pkgdir"/etc/pacman.d/alhp-mirrorlist
  install -Dm644 alhp-mirrorlist/mirrorlist.ipfs "$pkgdir"/etc/pacman.d/alhp-mirrorlist.ipfs
}

# vim:set ts=2 sw=2 et:
