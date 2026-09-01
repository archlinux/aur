# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.22.1
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
sha256sums_x86_64=('6e5c09b90bc48d87bf327cbccc2be720e67648fab1aeba2aa7fd9e9cd78adbd2')
sha256sums_aarch64=('aa36449ccb9656b7a8da2581621d1dbea288ba1c1a475e90bca2604738bb9852')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
