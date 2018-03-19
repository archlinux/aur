# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-tree-tabs
pkgver=1.5.3
pkgrel=1
pkgdesc='Manage your tabs in the sidebar'
url=https://addons.mozilla.org/en-US/firefox/addon/tree-tabs
arch=('any')
license=('MPL2')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/809637/tree_tabs-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=('abeb8b33277d9204396df27feaf58bb1e914e19e5f0de82d00a043070c914efb')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/TreeTabs@jagiello.it.xpi
}

# vim:set ts=2 sw=2 et:
