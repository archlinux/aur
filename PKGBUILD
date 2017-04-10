# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-umatrix
pkgver=1.0.0
pkgrel=1
pkgdesc='Point and click matrix to filter net requests by source, destination and type'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/613250/umatrix-$pkgver-fx+sm.xpi")
noextract=("${source##*/}")
sha512sums=('223603df003f63dd040281c833a7af6209b0bd257f18619e215d4a1a5af46f591abee359a6e596f5ce801939828f611cf15ca168b7a71bf760dc26e92bd58924')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
