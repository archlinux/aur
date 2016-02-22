# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-extension-ublock-origin
pkgver=1.6.2
pkgrel=1
pkgdesc='An efficient blocker add-on for your browser. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-ublock')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-an+fx+sm+tb.xpi")
noextract=("${source##*/}")
sha256sums=('b705c5b4e5c568f5c536e2e7471019f4c602d5395f2604a9f7235417c6c13ceb')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
