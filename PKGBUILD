# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-ublock-origin
pkgver=1.2.1
pkgrel=1
pkgdesc='An efficient blocker add-on for your browser. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-ublock')
source=("uBlock0-$pkgver.xpi::https://github.com/gorhill/uBlock/releases/download/$pkgver/uBlock0.firefox.xpi")
noextract=("${source%%::*}")
sha256sums=('7f723271781e2a553f96f6ad02ca2b900a79275240a878905e63adc9425cc1c9')

package() {
  install -Dm755 "${source%%::*}" "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
