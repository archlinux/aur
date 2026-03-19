# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.1.3
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
sha256sums_x86_64=('d63271e69fedf51cad9d9490e3182eac64bbaf3262e400831cce0e6d36124413')
sha256sums_aarch64=('88215f707446bbe3142eeeb502965b0c8cdef770f4ecf4e6ed84c43e863fb54e')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
