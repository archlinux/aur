# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=carve-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Carve out the essentials of your Clojure app.'
arch=('x86_64')
url='https://github.com/borkdude/carve'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.zip")

sha256sums_x86_64=('fbada9200f161d5c26a5d9c1b3555e1bbf9a287069fa93c0fad7ecc5d1706481')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
