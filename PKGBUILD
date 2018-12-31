# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-404-bookmarks
pkgver=1.7
pkgrel=1
pkgdesc='Show and remove expired bookmarks'
url=https://github.com/evilpie/404-bookmarks/
arch=('any')
license=('MPL2')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/779986/404_bookmarks-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('d28113471157f43b012341e3b38e577ba27d6def6f886a4ff2106a9f149c46b4')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{5f8d31ba-47fb-4b70-bf8d-d2113f6da22f}.xpi
}

# vim:set ts=2 sw=2 et:
