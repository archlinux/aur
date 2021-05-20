# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=babashka-bin
pkgver=0.4.2
pkgrel=1
pkgdesc='A Clojure babashka for the grey areas of Bash.'
arch=('x86_64')
url='https://github.com/borkdude/babashka'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.tar.gz")

sha256sums_x86_64=('38c48201b0097d69c969fb408b4dd8fe9d9898ddaf7083daa94dd173a0803128')

package() {
  install -Dm755 "${srcdir}/bb" "${pkgdir}/usr/bin/bb"
}
