# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A modern, cross-platform markdown viewer"
arch=('x86_64')
url="https://github.com/hamidfzm/glyph"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('glyph')
conflicts=('glyph')
source=("${url}/releases/download/v${pkgver}/Glyph_${pkgver}_amd64.deb")
sha256sums=('0f62a7ce1831169417badd17c56b066a3f7b42351bf8d8f0d111327b197cd057')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
