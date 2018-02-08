# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: Jérémie Detrey <Jeremie.Detrey@loria.fr>

_pkgname=tree_style_tab
pkgname=firefox-tree-style-tab
pkgver=2.4.11
pkgrel=1
pkgdesc='Firefox extension to show tabs like a tree'
arch=('any')
license=('MPL 1.1' 'GPL 2.0' 'LGPL 2.1')
url=http://piro.sakura.ne.jp/xul/_treestyletab.html.en
source=("https://addons.cdn.mozilla.net/user-media/addons/5890/$_pkgname-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=('eb005c0cdf4dd3f374295ae316c4393d7e0d9c30de1f411c3a09084c48318fbd')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/treestyletab@piro.sakura.ne.jp.xpi
}

# vim:set ts=2 sw=2 et:
