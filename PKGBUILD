# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=babashka-bin
pkgver=0.2.4
pkgrel=1
pkgdesc='A Clojure babushka for the grey areas of Bash.'
arch=('x86_64')
url='https://github.com/borkdude/babashka'
license=('EPL')
provides=('babashka-bin')
conflicts=('babashka-bin')

source=("https://github.com/borkdude/babashka/releases/download/v${pkgver/_/-}/${pkgname/\-bin/}-${pkgver/_/-}-linux-amd64.zip")

sha256sums=('d56ff45b80226685bf2f804718780a82d30cffa4bda701a28cb170de176bc1fa')

package() {
  install -Dm755 "${srcdir}/bb" "${pkgdir}/usr/bin/bb"
}
