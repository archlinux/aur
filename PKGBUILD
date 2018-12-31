# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-bookmarkdupes
pkgver=5.9
pkgrel=1
pkgdesc='Display/Remove duplicate bookmarks, empty folders or descriptions'
url=https://github.com/vaeth/bookmarkdupes
arch=('any')
license=('GPL')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/870263/bookmark_dupes-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('587e0f89dd4bfb5748165085430cb5a73c06752afeba891ece5352b90033c0ac')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/bookmarkdupes@martin-vaeth.org.xpi
}

# vim:set ts=2 sw=2 et:
