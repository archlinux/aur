# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-umatrix
pkgver=1.4.0
pkgrel=2
pkgdesc='Point and click matrix to filter net requests by source, destination and type'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/613250/umatrix-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('991f0fa5c64172b8a2bc0a010af60743eba1c18078c490348e1c6631882cbfc7')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
