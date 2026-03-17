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
sha256sums=('a3ebe8f9be238cc1c99d93757b02b6ff3b15be9918429fafe4112aa764cdf84c')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
