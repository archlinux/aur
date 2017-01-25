# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-ublock-origin
pkgver=1.10.6
pkgrel=1
pkgdesc='An efficient blocker add-on for various browsers. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-an+fx+sm+tb.xpi")
noextract=("${source##*/}")
sha512sums=('e14a689b7f7f07804e32a573919ca1fbee3fa6cf3efda8ee883e7343a0c682e14ee5ee8bb059bb140abc65d1182d588d581225aee7487a25ecb13e9b09117092')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
