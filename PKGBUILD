# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: Jérémie Detrey <Jeremie.Detrey@loria.fr>

_pkgname=tree_style_tab
pkgname=firefox-tree-style-tab
pkgver=2.4.19
pkgrel=1
pkgdesc='Firefox extension to show tabs like a tree'
arch=('any')
license=('MPL 1.1' 'GPL 2.0' 'LGPL 2.1')
groups=('firefox-addons')
url=http://piro.sakura.ne.jp/xul/_treestyletab.html.en
conflicts=('firefox-extension-tree-style-tab')
source=("https://addons.cdn.mozilla.net/user-media/addons/5890/$_pkgname-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=('65cb19031d2643627a685a12ecb6ccccc4f53ba516b0a29d04c7ffd609c4d075')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/treestyletab@piro.sakura.ne.jp.xpi
}

# vim:set ts=2 sw=2 et:
