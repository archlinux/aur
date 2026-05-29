# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.8.1
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
sha256sums_x86_64=('b9f53d160fa179292a229ded6d7fc8c0a6fd7389a9d3254b64d244d201053bbc')
sha256sums_aarch64=('b8a3fba7af8ef46d200719be6c03f5fb0ef2baeab1305c1659d8ef5c25b1d9e0')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
