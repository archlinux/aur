# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-ublock-origin
pkgver=1.13.4
pkgrel=1
pkgdesc='An efficient blocker add-on for various browsers. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-an+fx+sm+tb.xpi")
noextract=("${source##*/}")
sha512sums=('d7cb0e15eb4ea5377ddc047dfd915bedc36a8f2796c43a6cec1065ebebb242eebbb2c6ef40fb8d8f6fe9c06a0865d003142be35db27fc0995ed7c4ee745278fa')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
