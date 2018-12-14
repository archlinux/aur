# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tab-flip-for-tree-style-tab
pkgver=1.1.0
pkgrel=1
pkgdesc='Clicking active tab activates the last active one in Tree Style Tab'
url=https://framagit.org/ariasuni/tst-tabflip
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/936209/onglet_revers_pour_tree_style_tab-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('bbeecbfc77616beae7bd9f2b1998397ff522ad98a2cfff83da474aeee927d762')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{724545b6-7e17-4fa2-96e0-71eddf3c3319}.xpi
}

# vim:set ts=2 sw=2 et:
