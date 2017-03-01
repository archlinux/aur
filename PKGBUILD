# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-umatrix
pkgver=0.9.3.6
pkgrel=1
pkgdesc='Point and click matrix to filter net requests by source, destination and type'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/613250/umatrix-$pkgver-sm+fx.xpi")
noextract=("${source##*/}")
sha512sums=('f6e8862d21cf991ac98e67acf30daf4aac8732b85e55437f19f7e4b79efb77c7e71af0d2e3a2b6e464113cc29ddbc3bbb9fa1c899b9ed16c7e747c1e0f683b86')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
