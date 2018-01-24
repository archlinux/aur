# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-bookmarkdupes
pkgver=5.0
pkgrel=1
pkgdesc='Display/Remove duplicate bookmarks, empty folders or descriptions'
url=https://github.com/vaeth/bookmarkdupes
arch=('any')
license=('GPL')
source=("https://addons.cdn.mozilla.net/user-media/addons/870263/bookmark_dupes-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('57f4ad10c1faaa241b866cdd3bb8aa77dd088e58d45983c67c985d86e44f8bdd')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/bookmarkdupes@martin-vaeth.org.xpi
}

# vim:set ts=2 sw=2 et:
