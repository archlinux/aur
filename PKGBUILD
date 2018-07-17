# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-umatrix
pkgver=1.3.12
pkgrel=1
pkgdesc='Point and click matrix to filter net requests by source, destination and type'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/613250/umatrix-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('4ab1d1dc04b030e0515750be7788a724f1b506636f32ea0a59bb6cb9729918d0')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
