# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=babashka-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='A Clojure babashka for the grey areas of Bash.'
arch=('x86_64')
url='https://github.com/borkdude/babashka'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.tar.gz")

sha256sums_x86_64=('a34f491c99d98f7dd2f4cba088e856bc7d9100ad2fa3f3fd2812d471b5fa5685')

package() {
  install -Dm755 "${srcdir}/bb" "${pkgdir}/usr/bin/bb"
}
