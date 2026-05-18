# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.7.0
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
sha256sums_x86_64=('d615f1e9063f27f5af5ea3bfa483e2cb0975a408ff5ba22534c554e176dccd7b')
sha256sums_aarch64=('d7247e8181cf1be5adacbed18726ad79f8aebbad3b4c62db529e918efb2a76c6')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
