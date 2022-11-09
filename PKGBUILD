# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Brandon Carrell <brandoncarrell [@] gmail [dot] com>

pkgname=joker-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A Clojure interpreter and linter written in Go - Precompiled binary from official repository."
arch=('x86_64')
url="https://github.com/candid82/joker"
license=('EPL')
provides=('joker')
conflicts=('joker')

source=("https://github.com/candid82/joker/releases/download/v${pkgver}/${pkgname/\-bin/}-linux-amd64.zip")

sha256sums=('a2d05da729b49558333a2484be745c6f7a4f4fe25b39df039b3a255a43310c90')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
