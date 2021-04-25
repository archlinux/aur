# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=babashka-bin
pkgver=0.3.6
pkgrel=1
pkgdesc='A Clojure babashka for the grey areas of Bash.'
arch=('x86_64')
url='https://github.com/borkdude/babashka'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.tar.gz")

sha256sums_x86_64=('2a57e26944f3066e25cdb90cad7e356e7b08f38c956e07212cbeb2f7a5c298d1')

package() {
  install -Dm755 "${srcdir}/bb" "${pkgdir}/usr/bin/bb"
}
