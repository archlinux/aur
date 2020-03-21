# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-move-unloaded-tabs-for-tree-style-tab
pkgver=2.4
pkgrel=1
pkgdesc='Move tabs in the Tree Style Tab Sidebar without them becoming active'
url=https://github.com/Lej77/move-unloaded-tabs-for-tree-style-tab
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/966033/move_unloaded_tabs_for_tree_style_tab-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('9c1c5d8a8ae4a27428e7c1f7e8c1671b40bed388dafac35900f3b80c5118fa7b')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{731bf636-c808-4c86-b02f-af462eccc963}.xpi
}

# vim:set ts=2 sw=2 et:
