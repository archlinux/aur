# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tab-unloader-for-tree-style-tab
pkgver=6.2
pkgrel=1
pkgdesc='Tab unload options for Tree Style Tab'
url=https://github.com/Lej77/tab-unloader-for-tree-style-tab
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/947990/tab_unloader_for_tree_style_tab-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('9b665688a60eb188f31cbef16e541356dae6ba3bd0c030b43709f8b515eddd56')
b2sums=('6731e82ea14f117c095a9bdaa9d2c441bd47417bee42a8c7f5f755e470ae9f6021347a353dc52a622a15a5e412d80b2d1f176ac5094e6f8945521848093aee34')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{7aa0a466-58f8-427b-8cd2-e94645c4edc2}.xpi
}

# vim:set ts=2 sw=2 et:
