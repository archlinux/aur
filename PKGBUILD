# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-umatrix
pkgver=1.4.4
pkgrel=1
pkgdesc='Point and click matrix to filter net requests by source, destination and type'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("$url/releases/download/$pkgver/uMatrix_$pkgver.firefox.signed.xpi")
noextract=("${source##*/}")
sha256sums=('1de172b1d82de28c334834f7b0eaece0b503f59e62cfc0ccf23222b8f2cb88e5')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
