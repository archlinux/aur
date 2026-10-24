# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.27.0
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
sha256sums_x86_64=('96aec9593e8ec482df8f1623a8c7f42bd4f7fe25b2ceb84ed3f13d3c26a28f4e')
sha256sums_aarch64=('6a9060d28cc0db54783975ed0d25c434bb903724b1232d2eec9b2f8290d67dd8')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
