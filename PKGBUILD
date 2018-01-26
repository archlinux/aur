# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-bookmarkdupes
pkgver=5.1
pkgrel=1
pkgdesc='Display/Remove duplicate bookmarks, empty folders or descriptions'
url=https://github.com/vaeth/bookmarkdupes
arch=('any')
license=('GPL')
source=("https://addons.cdn.mozilla.net/user-media/addons/870263/bookmark_dupes-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=('94824cb29dbc08cceeee0100ee46850cde627d37630e9aa716c7d7853d6810fb')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/bookmarkdupes@martin-vaeth.org.xpi
}

# vim:set ts=2 sw=2 et:
