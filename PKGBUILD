# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A modern, cross-platform markdown viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/hamidfzm/glyph"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('glyph')
conflicts=('glyph')
source_x86_64=("${url}/releases/download/v${pkgver}/Glyph_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/Glyph_${pkgver}_arm64.deb")
sha256sums_x86_64=('2413b18f4d89597d0d028f63c41832c25eeaeef42dea6af8a4d094bd3bf1dd30')
sha256sums_aarch64=('6b6c3849b08df68261958b3e2a2e2c3bdc1cd93ac9a811d148930f3901a6d98c')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
