# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.2.0
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
sha256sums_x86_64=('1e2b1c75c2e36f74d8c5af2b39625e8fdd61872a1d9e6dc7bb69a49fd3e5f858')
sha256sums_aarch64=('2ad8019964a5c0dc73ad3a3ce5677adf9d07fa1b2e2894e5e4d4448bf2ebf986')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
