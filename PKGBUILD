# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-ublock-origin
pkgver=1.13.0
pkgrel=1
pkgdesc='An efficient blocker add-on for various browsers. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-an+fx+sm+tb.xpi")
noextract=("${source##*/}")
sha512sums=('11b43a05f435ec43588e4732c5827769f92f1da2d76fe484ff2f8e8828609a794b480332c8fb7c4c224f1e7b3adf4ae224bb37c587bbfc6fabd4b9573ecf121f')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
