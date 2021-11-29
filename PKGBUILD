# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Rohan Jain <crodjer [@] protonmail [dot] com>

pkgname=babashka-bin
pkgver=0.6.6
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

sha256sums_x86_64=('5bdc67d7cf32397e6e6336756ad7696a57930d24a619e1e9bb3ba0bf82c0c5e9')
sha256sums_aarch64=('159ab8a8e3b42b9649c27502e91ecccc2ed5671b387db9e6dfd5a088f970277b')

package() {
  install -Dm755 "${srcdir}/bb" "${pkgdir}/usr/bin/bb"
}
