# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tab-unloader-for-tree-style-tab
pkgver=6.1
pkgrel=1
pkgdesc='Tab unload options for Tree Style Tab'
url=https://github.com/Lej77/tab-unloader-for-tree-style-tab
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/947990/tab_unloader_for_tree_style_tab-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('a148354ed2b7e278188a59e6f3f04e8ebcca1437fe01d9f19b444a1d8aae782e')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{7aa0a466-58f8-427b-8cd2-e94645c4edc2}.xpi
}

# vim:set ts=2 sw=2 et:
