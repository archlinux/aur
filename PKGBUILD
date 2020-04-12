# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=babashka-bin
pkgver=0.0.83
pkgrel=1
pkgdesc='A Clojure babushka for the grey areas of Bash.'
arch=('x86_64')
url='https://github.com/borkdude/babashka'
license=('EPL')
provides=('babashka-bin')
conflicts=('babashka-bin')

source=("https://github.com/borkdude/babashka/releases/download/v${pkgver/_/-}/${pkgname/\-bin/}-${pkgver/_/-}-linux-amd64.zip")

sha256sums=('26125bf12ef5ac987ffcd3b4f2293b348aaa60937214a94d4302577417595dda')

package() {
  install -Dm755 "${srcdir}/bb" "${pkgdir}/usr/bin/bb"
}
