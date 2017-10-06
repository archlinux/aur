# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-umatrix
pkgver=1.1.0
pkgrel=1
pkgdesc='Point and click matrix to filter net requests by source, destination and type'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/613250/umatrix-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=('3099726fa99c3abdcab8c91399c0be79914dcce186bf951f43394847669e3ad3')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
