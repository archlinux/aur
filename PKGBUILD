# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-ublock-origin
pkgver=1.17.4
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('54c9a1380900eb1eba85df3a82393cef321e9c845fda227690d9377ef30e913e')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
