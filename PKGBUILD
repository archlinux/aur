# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tab-unloader-for-tree-style-tab
pkgver=6.12
pkgrel=1
pkgdesc='Tab unload options for Tree Style Tab'
url=https://github.com/Lej77/tab-unloader-for-tree-style-tab
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/947990/tab_unloader_for_tree_style_tab-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('c1bc9684775643773cc299702f4bdd0b5b77d19bd25b0acbf131a037c43a7bc9')
b2sums=('77a930a4d8e960ef4eb4b8dfd53d92ecf2cbb721d3b250bb3328f65a6dad4156862236b773ef6a4ec39570af5a855d16c2cf98d7cce3f73ee96016b2ba9d6b04')

package() {
  install -Dm644 "${source##*/}" \
    "$pkgdir"/usr/lib/firefox/browser/extensions/{7aa0a466-58f8-427b-8cd2-e94645c4edc2}.xpi
}

# vim:set ts=2 sw=2 et:
