# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=firefox-auto-tab-discard
pkgver=0.3.1
pkgrel=1
pkgdesc='Use native tab discard method to automatically reduce memory usage of inactive tab'
url=https://add0n.com/tab-discard.html
arch=('any')
license=('MPL2')
depends=('firefox')
groups=('firefox-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/1687405/auto_tab_discard-${pkgver}-an+fx.xpi")
noextract=("extension.xpi")
sha256sums=('a46c1afae474d4af19707a4dccaf2edb3ed0eecfc6cb244d61532da8a672e62e')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{c2c003ee-bd69-42a2-b0e9-6f34222cb046}.xpi"
}

