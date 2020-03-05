# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-bookmarkdupes
pkgver=6.3
pkgrel=1
pkgdesc='Display/Remove duplicate bookmarks, empty folders or descriptions'
url=https://github.com/vaeth/bookmarkdupes
arch=('any')
license=('GPL')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/870263/bookmark_dupes-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('f05a790f179671bd4ebbd3fa38ea3af7af6746138c71a0be8ed001d45cfa3054')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/bookmarkdupes@martin-vaeth.org.xpi
}

# vim:set ts=2 sw=2 et:
