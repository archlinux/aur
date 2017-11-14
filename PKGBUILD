# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-tree-tabs
pkgver=1.0
pkgrel=1
pkgdesc='Manage your tabs in the sidebar'
url=https://addons.mozilla.org/en-US/firefox/addon/tree-tabs
arch=('any')
license=('custom:MPLv2')
source=("https://addons.cdn.mozilla.net/user-media/addons/809637/tree_tabs-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=('990539f9eca10f0a2dda0b061b4332e1648a0362dddebd723a209163433e26c3')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/TreeTabs@jagiello.it.xpi
}

# vim:set ts=2 sw=2 et:
