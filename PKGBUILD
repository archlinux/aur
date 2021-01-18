# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=carve-bin
pkgver=0.0.1
pkgrel=1
pkgdesc='Carve out the essentials of your Clojure app.'
arch=('x86_64')
url='https://github.com/borkdude/carve'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.zip")

sha256sums_x86_64=('a0609bc276af6a54f315a1727b16fa2171e2175ab6a18ba1b9639936f83fe4e5')

package() {
  install -Dm755 "${srcdir}/carve" "${pkgdir}/usr/bin/carve"
}
