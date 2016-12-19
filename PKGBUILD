# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-ublock-origin
pkgver=1.10.4
pkgrel=1
pkgdesc='An efficient blocker add-on for various browsers. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-an+fx+sm+tb.xpi")
noextract=("${source##*/}")
sha512sums=('918fc3f057abf0a6b96cdc42ba840c57f2409fb4e8160b36f2612b0c0e5c093e120c07f70b92aa10b82d69f81ef69450f05ccfa872bcf3050a3b880fa88c45a9')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
