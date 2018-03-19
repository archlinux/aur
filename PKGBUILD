# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-bookmarkdupes
pkgver=5.7
pkgrel=1
pkgdesc='Display/Remove duplicate bookmarks, empty folders or descriptions'
url=https://github.com/vaeth/bookmarkdupes
arch=('any')
license=('GPL')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/870263/bookmark_dupes-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=('d793849fe9bc860bef17c48b10f0eda909ba8e6749b1622ef5194337be5c9255')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/bookmarkdupes@martin-vaeth.org.xpi
}

# vim:set ts=2 sw=2 et:
