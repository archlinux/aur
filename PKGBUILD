# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=carve-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Carve out the essentials of your Clojure app.'
arch=('x86_64')
url='https://github.com/borkdude/carve'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.zip")

sha256sums_x86_64=('76b92ac5fa52efaa3fab6f1eb71f141bfd8301373bbaafa63864be2f5823fea9')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
