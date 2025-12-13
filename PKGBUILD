# Maintainer: Your Name <your@email.com>
pkgname=pixelterm-c
pkgver=1.0.5
pkgrel=2
pkgdesc="A high-performance terminal image browser written in C, based on the Chafa library"
arch=('x86_64' 'aarch64')
url="https://github.com/zouyonghe/PixelTerm-C"
license=('LGPL-3.0-or-later')
depends=('chafa' 'glib2' 'gdk-pixbuf2')
makedepends=('pkgconf')
provides=('pixelterm-c')
conflicts=('pixelterm-c')
source_x86_64=("pixelterm::${url}/releases/download/v${pkgver}/pixelterm-amd64-linux")
source_aarch64=("pixelterm::${url}/releases/download/v${pkgver}/pixelterm-arm64-linux")
noextract=()
md5sums_x86_64=('953d9858d7d35a603b8fc37536cd2567')
md5sums_aarch64=('54576c22fc1068403174ff819917682f')

package() {
  install -Dm755 "${srcdir}/pixelterm" "${pkgdir}/usr/bin/pixelterm"
}
