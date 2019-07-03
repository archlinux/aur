# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-move-unloaded-tabs-for-tree-style-tab
pkgver=2.3
pkgrel=1
pkgdesc='Move tabs in the Tree Style Tab Sidebar without them becoming active'
url=https://github.com/Lej77/move-unloaded-tabs-for-tree-style-tab
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/966033/move_unloaded_tabs_for_tree_style_tab-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('fff03780bdfaf143198507a262963dd6267c7479dcfc2b89bde87a655ac7a6bc')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{731bf636-c808-4c86-b02f-af462eccc963}.xpi
}

# vim:set ts=2 sw=2 et:
