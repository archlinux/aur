# Maintainer: David Runge <dave@sleepmap.de>

_plugin_name=tab_tree
pkgname=firefox-extension-tab-tree
pkgver=1.4.9
pkgrel=2
pkgdesc="Tab Tree shows your tabs in the form of a tree structure. And also makes the user interface compact (optionally) to allow more space for the Web."
arch=('any')
license=('GPL3')
url="https://github.com/traxium/tabtree"
depends=("firefox>=26")
source=("https://addons.cdn.mozilla.net/user-media/addons/637996/${_plugin_name}-$pkgver-fx-linux.xpi")
sha512sums=('ce5e8c04a44bb01cd4e480393453a4a855c1e16c67364014674e08bf785d2953c76ead25c138b014750af157dd557b411e4b3b8b404efac3a5cc1fdd77ae21ff')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/TabsTree@traxium.xpi
}
