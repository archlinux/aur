# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.10.0
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
sha256sums_x86_64=('93e5d40ba44ee78563bc27e717ee954c714bbe6e63337d361a801c6c8cb53e4d')
sha256sums_aarch64=('86dbc1e9b0f29e8c20464b7e2aaa33daead86f270d65a3b0f8ebed7f204c8dcb')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
