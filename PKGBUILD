# Maintainer: Your Name <your@email.com>
pkgname=pixelterm-c
pkgver=1.0.5
pkgrel=1
pkgdesc="A high-performance terminal image browser written in C, based on the Chafa library"
arch=('amd64' 'arm64')
url="https://github.com/zouyonghe/PixelTerm-C"
license=('LGPL-3.0-or-later')
depends=('chafa' 'glib2' 'gdk-pixbuf2')
makedepends=('pkgconf')
provides=('pixelterm-c')
conflicts=('pixelterm-c')
source_amd64=("pixelterm::${url}/releases/download/v${pkgver}/pixelterm-amd64-linux")
source_arm64=("pixelterm::${url}/releases/download/v${pkgver}/pixelterm-arm64-linux")
noextract=()
md5sums_amd64=('d41d8cd98f00b204e9800998ecf8427e')
md5sums_arm64=('54576c22fc1068403174ff819917682f')

package() {
  install -Dm755 "${srcdir}/pixelterm" "${pkgdir}/usr/bin/pixelterm"
}
