# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-ublock
pkgver=0.8.8.2
pkgrel=1
pkgdesc='Finally, an efficient blocker. Easy on CPU and memory.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
source=("uBlock-$pkgver.xpi::https://github.com/gorhill/uBlock/releases/download/$pkgver/uBlock.firefox.xpi")
sha256sums=('5a01fe8c93d35dc896dfa6c22a025136de2c230e81b906f11e167c271bbdf3ee')

package() {
  local GLOBIGNORE=*.xpi:LICENSE.txt
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"{2b10c1c8-a11f-4bad-fe9c-1c11e82cac42}"

  install -d "$dstdir"
  cp -r * "$dstdir"
}

# vim:set ts=2 sw=2 et:
