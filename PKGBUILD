# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: Jérémie Detrey <Jeremie.Detrey@loria.fr>

_pkgname=tree_style_tab
pkgname=firefox-tree-style-tab
pkgver=2.4.18
pkgrel=1
pkgdesc='Firefox extension to show tabs like a tree'
arch=('any')
license=('MPL 1.1' 'GPL 2.0' 'LGPL 2.1')
groups=('firefox-addons')
url=http://piro.sakura.ne.jp/xul/_treestyletab.html.en
conflicts=('firefox-extension-tree-style-tab')
source=("https://addons.cdn.mozilla.net/user-media/addons/5890/$_pkgname-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=('b9fefa5b3f79d309e453d0c317c6933197a0552bc0f955f9ccd4a91c99d944b0')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/treestyletab@piro.sakura.ne.jp.xpi
}

# vim:set ts=2 sw=2 et:
