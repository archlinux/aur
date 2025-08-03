# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=librewolf-extension-synclair
pkgname=${_pkgname}-bin
pkgver=1.4.3
pkgrel=1
pkgdesc='Customizable home page/new tab using html, css and sheets of links'
arch=('x86_64')
url="https://codeberg.org/MorsMortium/Synclair"
license=('GPL-3.0-or-later')
depends=('librewolf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'zip')
sha512sums=('8dd3cf6fdbb2b4ee89a3f7854abe3ceb1b8841259971b55c1db62e9d9700927fee9374607a56b0e882e47b16e3fede2bf4b40293b81e2db672c6674e7c66adb7')
source=("https://codeberg.org/MorsMortium/Synclair/releases/download/${pkgver}/Synclair@morsmortium.codeberg.page.xpi")

package() {
  install -Dm644 "${srcdir}/Synclair@morsmortium.codeberg.page.xpi" "$pkgdir/usr/lib/librewolf/browser/extensions/Synclair@morsmortium.codeberg.page.xpi"
}
