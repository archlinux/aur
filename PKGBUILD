# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-404-bookmarks
pkgver=1.5
pkgrel=1
pkgdesc='Show and remove expired bookmarks'
url=https://github.com/evilpie/404-bookmarks/
arch=('any')
license=('MPL2')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/779986/404_bookmarks-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('2d9a3735f6c3ac13ae5a308bf56ed53c32182797181afbce8192413e97d17895')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{5f8d31ba-47fb-4b70-bf8d-d2113f6da22f}.xpi
}

# vim:set ts=2 sw=2 et:
