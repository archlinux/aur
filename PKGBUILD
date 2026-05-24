# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.8.0
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
sha256sums_x86_64=('fc214f4ebffda97e8cf7bde7e6cf03e33be6171e6ce51867f607a4ac0718c89d')
sha256sums_aarch64=('1f946273d56443315605cbadc211b7132f0c71128798a47e23fe2af8fd5d1df1')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
