# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.9.0
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
sha256sums_x86_64=('372b88fc587aeb82fc4fa71131da741a6c17c23ce5154b923589dc8c9d73cf92')
sha256sums_aarch64=('ad58584c390aeab546e325f4b2725da4025ac729299676e98c837c8f99eb6e8b')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
