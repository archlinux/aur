# Maintainer: hamidfzm <https://github.com/hamidfzm>
pkgname=glyph-md-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A modern, cross-platform markdown viewer"
arch=('x86_64')
url="https://github.com/hamidfzm/glyph"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('glyph')
conflicts=('glyph')
source=("${url}/releases/download/v${pkgver}/Glyph_${pkgver}_amd64.deb")
sha256sums=('38a131a76b32123f7a6baa1f7d6a6b5925db89539a68dce14ecc0eeaf266b95d')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
