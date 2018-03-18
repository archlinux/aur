# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-ublock-origin
pkgver=1.15.18
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('085fa5dc6011e6324cf03e3d0e88a95e881d1d37b39b8d28ea16ce57ddb3bff8')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
