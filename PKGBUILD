# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-ublock-origin
pkgver=1.9.12
pkgrel=1
pkgdesc='An efficient blocker add-on for various browsers. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-ublock-origin')
replaces=('firefox-extension-ublock-origin')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-tb+an+fx+sm.xpi")
noextract=("${source##*/}")
sha512sums=('0901bb47317888dc7823b5d7841ff089ce757fab3fef895e34ea5138b38ca5190e5055dae569022ae6350dd69de36739235df5d46c2aaef3cf0c6675b656c9ec')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
