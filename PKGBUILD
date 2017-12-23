# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-bookmarkdupes
pkgver=4.0
pkgrel=1
pkgdesc='Display/Remove duplicate bookmarks, empty folders or descriptions'
url=https://github.com/vaeth/bookmarkdupes
arch=('any')
license=('GPL')
source=("https://addons.cdn.mozilla.net/user-media/addons/870263/bookmark_dupes-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('e2df5b8431b87f5f9bb3fc18760323928b4b470b836ea7e0c3a08c3977946d4a')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/bookmarkdupes@martin-vaeth.org.xpi
}

# vim:set ts=2 sw=2 et:
