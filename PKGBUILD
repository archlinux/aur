# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=babashka-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='A Clojure babushka for the grey areas of Bash.'
arch=('x86_64')
url='https://github.com/borkdude/babashka'
license=('EPL')
provides=('babashka-bin')
conflicts=('babashka-bin')

source=("https://github.com/borkdude/babashka/releases/download/v${pkgver/_/-}/${pkgname/\-bin/}-${pkgver/_/-}-linux-amd64.zip")

sha256sums=('59ac471d14b4e33a5f871f53a4155cde945dcbc09c6c34f241c034838f5d76ad')

package() {
  install -Dm755 "${srcdir}/bb" "${pkgdir}/usr/bin/bb"
}
