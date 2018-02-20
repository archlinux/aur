# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-ublock-origin
pkgver=1.15.10
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('30b258803fd6cd988c5ba479f2f6ff5b4e9b40110c81e3421a6867b20ec718a6')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
