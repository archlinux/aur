# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-bookmark-tree-for-tree-style-tab
pkgver=3.0
pkgrel=1
pkgdesc='Bookmark and restore Tree Style Tab data'
url=https://github.com/Lej77/bookmark-tree-for-tree-style-tab
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/976890/bookmark_tree_for_tree_style_tab-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('318d662a6794e3fec73751b4e58f490658621ae40a71a5e38252464de9e0795d')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{dfa34782-2dbf-4997-83c7-508bd7477f46}.xpi
}

# vim:set ts=2 sw=2 et:
