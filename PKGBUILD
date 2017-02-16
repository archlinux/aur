# Maintainer: David Runge <dave@sleepmap.de>

_plugin_name=tab_tree
pkgname=firefox-extension-tab-tree
pkgver=1.4.9
pkgrel=1
pkgdesc="Tab Tree shows your tabs in the form of a tree structure. And also makes the user interface compact (optionally) to allow more space for the Web."
arch=('any')
license=('GPL3')
url="https://github.com/traxium/tabtree"
depends=("firefox>=26")
source=("https://addons.mozilla.org/firefox/downloads/file/420541/${_plugin_name}-${pkgver}-fx-linux.xpi")
sha512sums=('1e52b1289509b8aecb776728d769772e3a963352ed34d1e64c7502c8fabb843d500ba8294694a30d414686815d2c5ed0f390b194dbbf79fd21113532997884e2')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/TabsTree@traxium.xpi
}
