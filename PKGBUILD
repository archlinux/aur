# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-auto-tab-discard
pkgver=0.1.8
pkgrel=1
pkgdesc='Use native tab discard method to automatically reduce memory usage of inactive tab'
url=https://add0n.com/tab-discard.html
arch=('any')
license=('MPL2')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/909373/auto_tab_discard-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('3392264df6082e44d8edd6cfe2ebd71049cc5d4020ab25109a34d284f68813e5')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{c2c003ee-bd69-42a2-b0e9-6f34222cb046}.xpi
}

# vim:set ts=2 sw=2 et:
