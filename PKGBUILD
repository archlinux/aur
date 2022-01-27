# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tab-unloader-for-tree-style-tab
pkgver=6.11
pkgrel=1
pkgdesc='Tab unload options for Tree Style Tab'
url=https://github.com/Lej77/tab-unloader-for-tree-style-tab
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/947990/tab_unloader_for_tree_style_tab-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('053ddde8e98d4b70b4fa8650fa66983722366c3cc5c78b23e685facaa22c7925')
b2sums=('fa301bb7c338594f4ce7c0942ea6966b433ff5cb98078cf902ddf4b0e1c63d8a7e2927a9efa3751f36daa81f301ac1ba74df03478f4e682bcb22fd62c959c48e')

package() {
  install -Dm644 "${source##*/}" \
    "$pkgdir"/usr/lib/firefox/browser/extensions/{7aa0a466-58f8-427b-8cd2-e94645c4edc2}.xpi
}

# vim:set ts=2 sw=2 et:
