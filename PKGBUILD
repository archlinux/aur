# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tab-unloader-for-tree-style-tab
pkgver=6.14
pkgrel=1
pkgdesc='Tab unload options for Tree Style Tab'
url=https://github.com/Lej77/tab-unloader-for-tree-style-tab
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/947990/tab_unloader_for_tree_style_tab-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('9d6c075ffe4ab3689db1bf1000a74680402d797cc50a75a97b3ba8c92d068956')
b2sums=('8856609fdc30d6d7ab1e0529650a022e0ff52c2b98cb449ccbb2ace707160091b21a570513694a3e0c5d85a90bd4f1d61a211705c4a3dd4003ea30b6e2a2ff62')

package() {
  install -Dm644 "${source##*/}" \
    "$pkgdir"/usr/lib/firefox/browser/extensions/{7aa0a466-58f8-427b-8cd2-e94645c4edc2}.xpi
}

# vim:set ts=2 sw=2 et:
