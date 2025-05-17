# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=librewolf-extension-synclair
pkgname=${_pkgname}-bin
pkgver=1.4.2
pkgrel=1
pkgdesc='Customizable home page/new tab using html, css and sheets of links'
arch=('x86_64')
url="https://codeberg.org/MorsMortium/Synclair"
license=('GPL-3.0-or-later')
depends=('librewolf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'zip')
sha512sums=('03537c7a9714b5434e3abdd6fe3a54825089f08bc66f92efcccfbc9ba17f5ff9978624cac8d4da33566e86252b1f8fdf15eca90d2484b5b6b172d409c50fdeb5')
source=("https://codeberg.org/MorsMortium/Synclair/releases/download/${pkgver}/Synclair@morsmortium.codeberg.page.xpi")

package() {
  install -Dm644 "${srcdir}/Synclair@morsmortium.codeberg.page.xpi" "$pkgdir/usr/lib/librewolf/browser/extensions/Synclair@morsmortium.codeberg.page.xpi"
}
