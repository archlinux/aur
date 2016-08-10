# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-ublock-origin
pkgver=1.8.4
pkgrel=1
pkgdesc='An efficient blocker add-on for various browsers. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-ublock-origin')
replaces=('firefox-extension-ublock-origin')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-fx+tb+sm+an.xpi")
noextract=("${source##*/}")
sha256sums=('04ebef5428044c937d95ad9931b4b2b0e89b7d43e4d2ac4eca29f8141dda89eb')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
