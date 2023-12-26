# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Brandon Carrell <brandoncarrell [@] gmail [dot] com>

pkgname=joker-bin
pkgver=1.3.4
pkgrel=1
pkgdesc="A Clojure interpreter and linter written in Go - Precompiled binary from official repository."
arch=('x86_64')
url="https://github.com/candid82/joker"
license=('EPL')
provides=('joker')
conflicts=('joker')

source=("${pkgname}-${pkgver}-linux-amd64.zip::https://github.com/candid82/joker/releases/download/v${pkgver}/${pkgname/\-bin/}-linux-amd64.zip")

sha256sums=('1e3b533539b8e958cf280df273e932f82e5f652ee172ed51b7dc73adaebb3f9d')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
