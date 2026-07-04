# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.15.0
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
sha256sums_x86_64=('9b7e924e5c5ba5b8ff7e37bca8f5c495f654f5eb60c67e780f3d41ead99d24b2')
sha256sums_aarch64=('1a6085017d16e7985e5c46fc2878d6278dcc151f2240d3928a4fce9bc69e57a0')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
