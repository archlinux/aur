# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-ublock-origin
pkgver=1.14.24
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('13b9745323d9c4894b38e9f00e3c9fe64eb0a4187c2f2cac276b4f53e8f1e0a3')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
