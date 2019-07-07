# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Brandon Carrell <brandoncarrell [@] gmail [dot] com>

pkgname=joker-bin
pkgver=0.12.5
pkgrel=1
pkgdesc="A Clojure interpreter and linter written in Go - Precompiled binary from official repository."
arch=('x86_64')
url="https://github.com/candid82/joker"
license=('EPL')
provides=('joker')
conflicts=('joker')

source=("https://github.com/candid82/joker/releases/download/v${pkgver}/${pkgname/\-bin/}-${pkgver}-linux-amd64.zip")

sha256sums=('2a00881b87ae91eefcf7462c12a2de28436e5e66bbd51aad5e80d96bf9d1b5ad')

package() {
  install -Dm755 "${srcdir}/${pkgname/\-bin/}" "${pkgdir}/usr/bin/${pkgname/\-bin/}"
}
