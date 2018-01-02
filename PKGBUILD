# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-tree-tabs
pkgver=1.3
pkgrel=1
pkgdesc='Manage your tabs in the sidebar'
url=https://addons.mozilla.org/en-US/firefox/addon/tree-tabs
arch=('any')
license=('custom:MPLv2')
source=("https://addons.cdn.mozilla.net/user-media/addons/809637/tree_tabs-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=('b5b7ae0fa6d3f5de721273c06771b9608a05e4cab66b368e2c07d5e982d6f462')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/TreeTabs@jagiello.it.xpi
}

# vim:set ts=2 sw=2 et:
