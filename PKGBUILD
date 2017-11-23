# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-umatrix
pkgver=1.1.10
pkgrel=1
pkgdesc='Point and click matrix to filter net requests by source, destination and type'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/613250/umatrix-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('bdfcb5bcd34ad75beeb4197c7d34c57b9e856eff9d46820a72ec32d93391a070')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
