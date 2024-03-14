# Maintainer: Nico Domino <yo at ndo dot dev>
pkgname=('rose-pine-hyprcursor')
pkgbase=rose-pine-hyprcursor
pkgver=v0.3.0.r0.g4d59124
pkgrel=2
arch=('any')
url="https://github.com/ndom91/rose-pine-hyprcursor"
license=('GPL-3.0-or-later')
makedepends=('git')
source=('git+https://github.com/ndom91/rose-pine-hyprcursor')
sha256sums=('SKIP')

package() {
  cd rose-pine-hyprcursor || return
  install -d "$pkgdir/usr/share/icons/rose-pine-hyprcursor"
  cp -ar --no-preserve=ownership \
    hyprcursors \
    manifest.hl \
    "$pkgdir/usr/share/icons/rose-pine-hyprcursor"
}
