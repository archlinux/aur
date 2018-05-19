# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-tree-tabs
pkgver=1.6.0
pkgrel=1
pkgdesc='Manage your tabs in the sidebar'
url=https://addons.mozilla.org/en-US/firefox/addon/tree-tabs
arch=('any')
license=('MPL2')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/809637/tree_tabs-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=('509b65b877813f38a697f7b5448260733a0f38b8468ad936e52476b2d270820c')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/TreeTabs@jagiello.it.xpi
}

# vim:set ts=2 sw=2 et:
