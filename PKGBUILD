# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: Jérémie Detrey <Jeremie.Detrey@loria.fr>

_pkgname=tree_style_tab
pkgname=firefox-tree-style-tab
pkgver=2.6.6
pkgrel=1
pkgdesc='Firefox extension to show tabs like a tree'
arch=('any')
license=('MPL' 'GPL' 'LGPL')
groups=('firefox-addons')
url=http://piro.sakura.ne.jp/xul/_treestyletab.html.en
conflicts=('firefox-extension-tree-style-tab')
source=("https://addons.cdn.mozilla.net/user-media/addons/5890/$_pkgname-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('5de8ece0e368379a68be3d2c01d629e776447b5d0f498f1be83e061fdd44c42f')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/treestyletab@piro.sakura.ne.jp.xpi
}

# vim:set ts=2 sw=2 et:
