# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="A modern, cross-platform markdown viewer"
arch=('x86_64' 'aarch64')
url="https://glyph-md.github.io"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('glyph')
conflicts=('glyph')
# Releases live on the GitHub repo, not the homepage in url= above
source_x86_64=("https://github.com/hamidfzm/glyph/releases/download/v${pkgver}/Glyph_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/hamidfzm/glyph/releases/download/v${pkgver}/Glyph_${pkgver}_arm64.deb")
sha256sums_x86_64=('cc2c0229577d3137bce20416143f49344c1d9ce2a787af2e353b371cac5189bd')
sha256sums_aarch64=('7cbbb693642f185cb9593245395f1418b3144dca45cbf37faa65ca751d56c75d')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
