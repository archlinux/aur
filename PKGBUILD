# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=babashka-bin
pkgver=0.0.71
pkgrel=1
pkgdesc='A Clojure babushka for the grey areas of Bash.'
arch=('x86_64')
url='https://github.com/borkdude/babashka'
license=('EPL')
provides=('babashka-bin')
conflicts=('babashka-bin')

source=("https://github.com/borkdude/babashka/releases/download/v${pkgver/_/-}/${pkgname/\-bin/}-${pkgver/_/-}-linux-amd64.zip")

sha256sums=('75d68f05471bd9a1da6fc66ad47fc6faf1feec40ac7dd6fd62a21a690be894b5')

package() {
  install -Dm755 "${srcdir}/bb" "${pkgdir}/usr/bin/bb"
}
