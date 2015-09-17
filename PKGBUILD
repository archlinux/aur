# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-ublock-origin
pkgver=1.1.1
pkgrel=1
pkgdesc='An efficient blocker add-on for your browser. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-ublock')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-sm+fx+an.xpi")
noextract=("${source##*/}")
sha256sums=('1b11c30ac5d66f8a9e008decb35d0f8797bbecd0656e6ddf0de36c4c9408a7e6')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
