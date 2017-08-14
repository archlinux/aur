# Maintainer: David Runge <dave@sleepmap.de>

_plugin_name=tab_tree
pkgname=firefox-extension-tab-tree
pkgver=1.5.1
pkgrel=1
pkgdesc="Tab Tree shows your tabs in the form of a tree structure. And also makes the user interface compact (optionally) to allow more space for the Web."
arch=('any')
license=('GPL3')
url="https://github.com/traxium/tabtree"
depends=("firefox>=26")
source=("https://addons.cdn.mozilla.net/user-media/addons/637996/${_plugin_name}-$pkgver-fx-linux.xpi")
sha512sums=('97aafc329da1788485f7460df542046833acda6f786f41dc78f7035bec3ac36e1adc742362e60b9f6db3766db26c2acab72ae4a737349fed2f2719b2a4fb03a5')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/TabsTree@traxium.xpi
}
