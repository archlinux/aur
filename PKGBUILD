# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=librewolf-extension-synclair
pkgname=${_pkgname}-bin
pkgver=1.4.1
pkgrel=1
pkgdesc='Customizable home page/new tab using html, css and sheets of links'
arch=('x86_64')
url="https://codeberg.org/MorsMortium/Synclair"
license=('GPL-3.0-or-later')
depends=('librewolf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'zip')
sha512sums=('e6904409a101963d5873671258e6dc7a356ebb43a2b09b7ae0abf18deb0648622441f37727eef7cfc1071c5a12195e3f5cc7b5f45ac8097c061e88a3d0193438')
source=("https://codeberg.org/MorsMortium/Synclair/releases/download/${pkgver}/Synclair@morsmortium.codeberg.page.xpi")

package() {
  install -Dm644 "${srcdir}/Synclair@morsmortium.codeberg.page.xpi" "$pkgdir/usr/lib/librewolf/browser/extensions/Synclair@morsmortium.codeberg.page.xpi"
}
