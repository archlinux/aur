# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.15.1
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
sha256sums_x86_64=('78361e30a3638b382dd3e26c85d9dfbe513f9b2afebce6cd1f7cab819b8bc01e')
sha256sums_aarch64=('60f7a10d6e2ed685857beb4d97cdef7c68c614f5257a1353c88ac793ea7343db')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
