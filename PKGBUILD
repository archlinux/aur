# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-bookmarkdupes
pkgver=2.4
pkgrel=1
pkgdesc='Display/Remove duplicate bookmarks, empty folders or descriptions'
url=https://github.com/vaeth/bookmarkdupes
arch=('any')
license=('GPL')
source=("https://addons.cdn.mozilla.net/user-media/addons/870263/lesezeichenduplikate-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('b36309e3991cde6b5a7315119a046fb00723f4f83d6bc00d5c659ea24c9ad80a')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/bookmarkdupes@martin-vaeth.org.xpi
}

# vim:set ts=2 sw=2 et:
