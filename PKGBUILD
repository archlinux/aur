# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-extension-umatrix
pkgver=0.9.3.2
pkgrel=1
pkgdesc='Point and click matrix to filter net requests by source, destination and type'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-ublock')
source=("https://addons.cdn.mozilla.net/user-media/addons/613250/umatrix-$pkgver-sm+fx.xpi")
noextract=("${source##*/}")
sha256sums=('e36c6f21cb3216f50b863d4faed8dc29b02004b8db53bd17ac7af48c1f4ae121')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
