# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Rohan Jain <crodjer [@] protonmail [dot] com>

pkgname=babashka-bin
pkgver=0.7.0
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

sha256sums_x86_64=('963d557941aef1384fdb644c45e75fda71a6ca8acb850b5c3bef1a30cc549a16')
sha256sums_aarch64=('c10e7976f557d2cf165b9afc1b1184f97c8436561d570d1c5edf5f68350b19ac')

package() {
  install -Dm755 "${srcdir}/bb" "${pkgdir}/usr/bin/bb"
}
