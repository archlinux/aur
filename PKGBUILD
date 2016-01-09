# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-extension-ublock-origin
pkgver=1.5.3
pkgrel=1
pkgdesc='An efficient blocker add-on for your browser. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-ublock')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-sm+tb+fx+an.xpi")
noextract=("${source##*/}")
sha256sums=('61f5d8c770c6a1e64803e1d2bc8b5e484a8c32c9822b93639d09e6f8735953d6')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
