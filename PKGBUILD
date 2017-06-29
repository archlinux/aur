# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-tree-tabs
pkgver=0.0.16
pkgrel=1
pkgdesc='Manage your tabs in the sidebar'
url=https://addons.mozilla.org/en-US/firefox/addon/tree-tabs
arch=('any')
license=('custom:MPLv2')
source=("https://addons.cdn.mozilla.net/user-media/addons/809637/tree_tabs-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha512sums=('f31a64bcb26a02fe23b6074caa566f9b30025a92023e7895319cc3349adc6b689e0c717c9f80fcf929773483b14a9cfd6f26f395fa711f97277e40e680ba7949')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/TreeTabs@jagiello.it.xpi
}

# vim:set ts=2 sw=2 et:
