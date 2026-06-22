# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.12.0
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
sha256sums_x86_64=('f16f491090d9a96714e368ba2472ba9e8c247f629538f8efaae2e1bf67ae722c')
sha256sums_aarch64=('f01305c884219e114f08c095324d65aface304a3100179fec5c3671af57088e2')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
