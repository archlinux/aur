# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-tree-tabs
pkgver=1.5
pkgrel=1
pkgdesc='Manage your tabs in the sidebar'
url=https://addons.mozilla.org/en-US/firefox/addon/tree-tabs
arch=('any')
license=('MPL2')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/809637/tree_tabs-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=('d0ccf96ada57331554a637c58849f044890f20bc33d54ba03a4d093c515b6864')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/TreeTabs@jagiello.it.xpi
}

# vim:set ts=2 sw=2 et:
