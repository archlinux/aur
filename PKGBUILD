# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Rohan Jain <crodjer [@] protonmail [dot] com>

pkgname=babashka-bin
pkgver=0.6.2
pkgrel=1
pkgdesc='A Clojure babashka for the grey areas of Bash.'
arch=('x86_64' 'aarch64')
url='https://github.com/borkdude/babashka'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64-static.tar.gz")

sha256sums_x86_64=('40e2d0c71d192cca46a987f01dc3e06780f9ee6b379837739bd7baaa239fdec6')
sha256sums_aarch64=('7ec9fa6a4213e03f03ba95b0d17136d0053bb1890f5c08df8ba2ef3b52de4abe')

package() {
  install -Dm755 "${srcdir}/bb" "${pkgdir}/usr/bin/bb"
}
