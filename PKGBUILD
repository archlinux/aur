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
sha256sums=('d1800fe2e6816420af40d6ba9c2c58250ad78bf839b23469dad3be9a7dd2ac48')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
