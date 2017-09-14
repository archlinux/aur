# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-ublock-origin
pkgver=1.14.8
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('31a95d7af8c65a500f30fb0361e50c2cfdc5468f8f1cfeb447692f601f881222')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
