# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.11.0
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
sha256sums_x86_64=('35c7790c8acc8507a1b9ce7bd90b0d6eadcb740c7568e7b2d68e5d13ccc363e2')
sha256sums_aarch64=('ff38e815581bf13ecf8b8dfb5a0d2ca5271b2e1a175ad0002837a2479016c3c5')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
