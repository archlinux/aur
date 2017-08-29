# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-ublock-origin
pkgver=1.13.10
pkgrel=1
pkgdesc='An efficient blocker add-on for various browsers. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
source=("https://addons.mozilla.org/firefox/downloads/file/708468/ublock_origin-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('9300d9d6fb6ee574b2912aada6487af72d625727949e2a81172217e234ab4501')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
