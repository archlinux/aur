# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Brandon Carrell <brandoncarrell [@] gmail [dot] com>

pkgname=joker-bin
pkgver=1.5.6
pkgrel=1
pkgdesc="A Clojure interpreter and linter written in Go - Precompiled binary from official repository."
arch=('x86_64')
url="https://github.com/candid82/joker"
license=('EPL')
options=(!debug)
provides=('joker')
conflicts=('joker')

source=("${pkgname}-${pkgver}-linux-amd64.zip::https://github.com/candid82/joker/releases/download/v${pkgver}/${pkgname/\-bin/}-linux-amd64.zip")

sha256sums=('640f85b71d1d64a48c0aae56c44fc9b3a51e7b18f8b967c3197881c89e437377')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
