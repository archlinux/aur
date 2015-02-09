# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-ublock
pkgver=0.8.6.0
pkgrel=2
pkgdesc='Finally, an efficient blocker. Easy on CPU and memory.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
source=("uBlock-$pkgver.xpi::https://github.com/gorhill/uBlock/releases/download/$pkgver/uBlock.firefox.xpi")
sha256sums=('c9c7080f735907b84b69302dc1c6d4690343deac38a27f78b15f9a174bac7c0b')

package() {
  local GLOBIGNORE=*.xpi:LICENSE.txt
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"{2b10c1c8-a11f-4bad-fe9c-1c11e82cac42}"

  install -d "$dstdir"
  cp -r * "$dstdir"
}

# vim:set ts=2 sw=2 et:
