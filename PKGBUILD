# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Brandon Carrell <brandoncarrell [@] gmail [dot] com>

pkgname=joker-bin
pkgver=0.17.1
pkgrel=1
pkgdesc="A Clojure interpreter and linter written in Go - Precompiled binary from official repository."
arch=('x86_64')
url="https://github.com/candid82/joker"
license=('EPL')
provides=('joker')
conflicts=('joker')

source=("https://github.com/candid82/joker/releases/download/v${pkgver}/${pkgname/\-bin/}-${pkgver}-linux-amd64.zip")

sha256sums=('3e4a71408d85f8aa4c3054c6f71d0f277e11e258ba8433ebacb8811c1fbe9ad5')

package() {
  install -Dm755 "${srcdir}/${pkgname/\-bin/}" "${pkgdir}/usr/bin/${pkgname/\-bin/}"
}
