# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-bookmarkdupes
pkgver=6.0
pkgrel=1
pkgdesc='Display/Remove duplicate bookmarks, empty folders or descriptions'
url=https://github.com/vaeth/bookmarkdupes
arch=('any')
license=('GPL')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/870263/bookmark_dupes-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('a41216bc82f9d51ce5b99682a097663bbf913c04939d66787e6e8ba918bebf7a')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/bookmarkdupes@martin-vaeth.org.xpi
}

# vim:set ts=2 sw=2 et:
