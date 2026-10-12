# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.26.0
pkgrel=1
pkgdesc="A modern, cross-platform markdown viewer"
arch=('x86_64' 'aarch64')
url="https://glyph-md.github.io"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('glyph')
conflicts=('glyph')
# Releases live on the GitHub repo, not the homepage in url= above
source_x86_64=("https://github.com/hamidfzm/glyph/releases/download/v${pkgver}/Glyph_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/hamidfzm/glyph/releases/download/v${pkgver}/Glyph_${pkgver}_arm64.deb")
sha256sums_x86_64=('3e91110fe8300f83b7f7236642ee94c06d65c213fa211cf38688c1d89571b98c')
sha256sums_aarch64=('12772f75004e2528149051a9894d3f2564f4e4246c6c5982b3e17116a070820b')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
