# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Brandon Carrell <brandoncarrell [@] gmail [dot] com>

pkgname=joker-bin
pkgver=0.15.4
pkgrel=1
pkgdesc="A Clojure interpreter and linter written in Go - Precompiled binary from official repository."
arch=('x86_64')
url="https://github.com/candid82/joker"
license=('EPL')
provides=('joker')
conflicts=('joker')

source=("https://github.com/candid82/joker/releases/download/v${pkgver}/${pkgname/\-bin/}-${pkgver}-linux-amd64.zip")

sha256sums=('e4aaced1745a4a7d245499c117d79defc058c1edaf1d3186a35e6cfa38c3855e')

package() {
  install -Dm755 "${srcdir}/${pkgname/\-bin/}" "${pkgdir}/usr/bin/${pkgname/\-bin/}"
}
