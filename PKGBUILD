# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-extension-ublock-origin
pkgver=1.5.0
pkgrel=1
pkgdesc='An efficient blocker add-on for your browser. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-ublock')
source=("https://addons.cdn.mozilla.net/user-media/addons/607454/ublock_origin-$pkgver-sm+tb+fx+an.xpi")
noextract=("${source##*/}")
sha256sums=('dafa6c2ae3604d47f4126f46344bde8135ac01b1fa39e0dcbd06194d453f1037')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
