# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.15.2
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
sha256sums_x86_64=('d8f326feb7bd914e101441bf16cea6eada50d740a4c6179934575e9bf881301f')
sha256sums_aarch64=('9b7ab58b84c71f025a4f99707383800569b5023a821387bf097876a121341a7f')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
