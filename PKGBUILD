# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.5.0
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
sha256sums_x86_64=('3feb1579f7f9863ff8a16b7295a4260d3664716baad9618f672b2e712c8625d3')
sha256sums_aarch64=('a2798988ed58d49436e0036aa82cfee45abd3f9274013108a68d139e0010652d')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
