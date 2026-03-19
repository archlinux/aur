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
sha256sums_x86_64=('f4407ae51a6683dc6a8c02e3ebb82f5a0bdfdc68e629913653caf019fa50f89a')
sha256sums_aarch64=('00a2d04e27ad99bb30f223e72c8dc8f8f4262cb68e62e1058f54bcdc043bf7d8')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
