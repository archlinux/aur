# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.22.0
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
sha256sums_x86_64=('1c430dce3cda1c5c4240d1fb8021551cbc8102bbf8c28890020a3260027f35d0')
sha256sums_aarch64=('ce25b009f922151ed9d150de26874fc2028143111b7e34be871cdec70ef1adc4')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
