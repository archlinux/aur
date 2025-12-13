# Maintainer: Your Name <your@email.com>
pkgname=pixelterm-c
pkgver=1.0.4
pkgrel=1
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
md5sums_x86_64=('731d7f2d6ca1d05648c3ba855756a81b')
md5sums_aarch64=('9d1ead73e678fa2f51a70a933b0bf017')

package() {
  install -Dm755 "${srcdir}/pixelterm" "${pkgdir}/usr/bin/pixelterm"
}
