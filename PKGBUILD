# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tab-unloader-for-tree-style-tab
pkgver=6.7
pkgrel=1
pkgdesc='Tab unload options for Tree Style Tab'
url=https://github.com/Lej77/tab-unloader-for-tree-style-tab
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/947990/tab_unloader_for_tree_style_tab-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('348d35bd27755fd9eb9b097ba0b07fb7b971d026c48b8ce7032c767947a27efa')
b2sums=('c875ae94e5ea8dabf80fedf83682c0c12c9df12a534c68850f3d6e1e0b5a055514890a4e099bca8742db509d5912f9877f94a54c68daf5ab201b8662be412456')

package() {
  install -Dm644 "${source##*/}" \
    "$pkgdir"/usr/lib/firefox/browser/extensions/{7aa0a466-58f8-427b-8cd2-e94645c4edc2}.xpi
}

# vim:set ts=2 sw=2 et:
