# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-extension-umatrix
pkgver=0.9.3.1
pkgrel=1
pkgdesc='Point and click matrix to filter net requests by source, destination and type'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-ublock')
source=("https://addons.cdn.mozilla.net/user-media/addons/613250/umatrix-$pkgver-sm+fx.xpi")
noextract=("${source##*/}")
sha256sums=('6a47eaedbe155bc708a9d427f45d05b64ca6f2e28bdb3612cf8ce64a70d39c08')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
