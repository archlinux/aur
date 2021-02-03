# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=carve-bin
pkgver=0.0.2
pkgrel=1
pkgdesc='Carve out the essentials of your Clojure app.'
arch=('x86_64')
url='https://github.com/borkdude/carve'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.zip")

sha256sums_x86_64=('9d63dfcb28a1678176d0d945ff6f3006edb959b5d1aa6238b22aa8f42058e5b1')

package() {
  install -Dm755 "${srcdir}/carve" "${pkgdir}/usr/bin/carve"
}
