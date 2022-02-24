# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Rohan Jain <crodjer [@] protonmail [dot] com>

pkgname=babashka-bin
pkgver=0.7.6
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

sha256sums_x86_64=('bfdb05eb74cbba8e722a4c31eb4aea7b22255be20ea560de2519d28f3c18d704')
sha256sums_aarch64=('67c090f8393ae4b75ffc3df6e83f88fbffa4da554a726491a6b5ab15a1a0a77a')

package() {
  install -Dm755 "${srcdir}/bb" "${pkgdir}/usr/bin/bb"
}
