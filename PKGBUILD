# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.6.0
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
sha256sums_x86_64=('8f2e4e17dbc5393003f38e629ffcf6fa3460d47739eccfe402dce02ccc805653')
sha256sums_aarch64=('d53fdd1ba047a0c728863b87a5b995b84ba22a0fd98dc5555d194f907f92932d')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
