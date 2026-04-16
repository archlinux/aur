# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.4.0
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
sha256sums_x86_64=('44a6f1d13bbcbae01b9635fc5e71dee62be8d725b257381f47d3482a5c3d1bce')
sha256sums_aarch64=('2b05aa6b7acedf120328da70ff24af25b3cb1a806557c93f143e900d081ca074')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
