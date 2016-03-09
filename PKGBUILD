# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-extension-ublock-origin
pkgver=1.6.4
pkgrel=1
pkgdesc='An efficient blocker add-on for your browser. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-ublock')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-sm+tb+an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('9ed01e578cff5ee807878a0c4edcf250e7864548a9f6f0f937f1a9adac5ac7a1')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
