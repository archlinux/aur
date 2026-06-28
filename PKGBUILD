# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="A modern, cross-platform markdown viewer"
arch=('x86_64' 'aarch64')
url="https://glyph-md.github.io"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('glyph')
conflicts=('glyph')
source_x86_64=("${url}/releases/download/v${pkgver}/Glyph_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/Glyph_${pkgver}_arm64.deb")
sha256sums_x86_64=('56b52520b76a084711c6d4001e28d573d7de776427c499cf4c6813250ecf23df')
sha256sums_aarch64=('1c0b0730b0d0be346fb0f383842b7691bda0eac9602e2b7b8dbc681776c82732')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
