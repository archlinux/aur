# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-umatrix
pkgver=1.2.0
pkgrel=1
pkgdesc='Point and click matrix to filter net requests by source, destination and type'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/613250/umatrix-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('001b8c7cc02796d8dea837bb5b8bf9c88a5026035ffa18718fa7e3418d67f5f0')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
