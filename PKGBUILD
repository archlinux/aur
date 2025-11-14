# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Brandon Carrell <brandoncarrell [@] gmail [dot] com>

pkgname=joker-bin
pkgver=1.5.7
pkgrel=1
pkgdesc="A Clojure interpreter and linter written in Go - Precompiled binary from official repository."
arch=('x86_64')
url="https://github.com/candid82/joker"
license=('EPL')
options=(!debug)
provides=('joker')
conflicts=('joker')

source=("${pkgname}-${pkgver}-linux-amd64.zip::https://github.com/candid82/joker/releases/download/v${pkgver}/${pkgname/\-bin/}-linux-amd64.zip")

sha256sums=('087ba2a94297ff97d767753536fea00dd6ad759a4a1471f446e246d3f777c058')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
