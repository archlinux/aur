# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=babashka-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='A Clojure babushka for the grey areas of Bash.'
arch=('x86_64')
url='https://github.com/borkdude/babashka'
license=('EPL')
provides=('babashka-bin')
conflicts=('babashka-bin')

source=("https://github.com/borkdude/babashka/releases/download/v${pkgver/_/-}/${pkgname/\-bin/}-${pkgver/_/-}-linux-amd64.zip")

sha256sums=('3650a8c7c51732aff2d1d0464e36240d2244709f1466b90142c2bf3b244843a7')

package() {
  install -Dm755 "${srcdir}/bb" "${pkgdir}/usr/bin/bb"
}
