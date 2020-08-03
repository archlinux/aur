# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Brandon Carrell <brandoncarrell [@] gmail [dot] com>

pkgname=joker-bin
pkgver=0.15.6
pkgrel=1
pkgdesc="A Clojure interpreter and linter written in Go - Precompiled binary from official repository."
arch=('x86_64')
url="https://github.com/candid82/joker"
license=('EPL')
provides=('joker')
conflicts=('joker')

source=("https://github.com/candid82/joker/releases/download/v${pkgver}/${pkgname/\-bin/}-${pkgver}-linux-amd64.zip")

sha256sums=('11b7a51c99f92037ba361f59dd8d9bc342d8f86f3b30101bfe92a157eaae4f97')

package() {
  install -Dm755 "${srcdir}/${pkgname/\-bin/}" "${pkgdir}/usr/bin/${pkgname/\-bin/}"
}
