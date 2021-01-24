# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=babashka-bin
pkgver=0.2.8
pkgrel=1
pkgdesc='A Clojure babashka for the grey areas of Bash.'
arch=('x86_64')
url='https://github.com/borkdude/babashka'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.zip")

sha256sums_x86_64=('a960c92c0debe4416b120bbd2ee1debf543343a1585a1a9d36d3916b8eb0db77')

package() {
  install -Dm755 "${srcdir}/bb" "${pkgdir}/usr/bin/bb"
}
