# Maintainer: David Runge <dave@sleepmap.de>

_plugin_name=tab_tree
_id=637996
pkgname=firefox-extension-tab-tree
pkgver=1.5.1
pkgrel=3
pkgdesc="Shows your tabs in the form of a tree structure. And also makes the user interface compact (optionally) to allow more space for the Web."
arch=('any')
license=('GPL3')
url="https://github.com/traxium/tabtree"
depends=('firefox')
source=("${_plugin_name}-${pkgver}.xpi::https://addons.cdn.mozilla.net/user-media/addons/${_id}/${_plugin_name}-${pkgver}-fx-linux.xpi")
sha512sums=('97aafc329da1788485f7460df542046833acda6f786f41dc78f7035bec3ac36e1adc742362e60b9f6db3766db26c2acab72ae4a737349fed2f2719b2a4fb03a5')

package() {
  install -Dm644 ${_plugin_name}-${pkgver}.xpi "$pkgdir"/usr/lib/firefox/browser/extensions/TabsTree@traxium.xpi
}
