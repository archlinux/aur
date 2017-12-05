# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-umatrix
pkgver=1.1.16
pkgrel=1
pkgdesc='Point and click matrix to filter net requests by source, destination and type'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/613250/umatrix-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('f4dcd35aef61e2cb38b399f039dc191b9015ea305c400d93b77f07995a791681')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
