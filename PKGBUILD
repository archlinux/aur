# Maintainer: Your Name <your@email.com>
pkgname=pixelterm-c
pkgver=1.0.7
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
md5sums_x86_64=('b880ef57490c3fcef82d59fa33361a9c')
md5sums_aarch64=('6ca90cf54c31f52ac9cd2253ccd1bd9f')

package() {
  install -Dm755 "${srcdir}/pixelterm" "${pkgdir}/usr/bin/pixelterm"
}
