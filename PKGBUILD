# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-extension-ublock-origin
pkgver=1.6.1
pkgrel=1
pkgdesc='An efficient blocker add-on for your browser. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-ublock')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-fx+an+sm+tb.xpi")
noextract=("${source##*/}")
sha256sums=('cd0ca9277f842c740f763547f7b649f5184d8695b86856364fc4c0d58577ae6b')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
