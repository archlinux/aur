# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tab-flip-for-tree-style-tab
pkgver=1.2.0.1
pkgrel=1
pkgdesc='Clicking active tab activates the last active one in Tree Style Tab'
url=https://framagit.org/ariasuni/tst-tabflip
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/936209/onglet_revers_pour_tree_style_tab-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('4e3151012657d3c8e53e9ae0cf89a841f7d204bf1d8f47f806b52512edbd2909')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{724545b6-7e17-4fa2-96e0-71eddf3c3319}.xpi
}

# vim:set ts=2 sw=2 et:
