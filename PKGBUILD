# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=grape-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='Grape is a syntax-aware grep-like utility for Clojure code. It allows you to search for code patterns using Clojure data structures.'
arch=('x86_64')
url='https://github.com/bfontaine/grape'
license=('EPL')
provides=('grape')
conflicts=()

source=("https://github.com/bfontaine/grape/releases/download/${pkgver}/${pkgname/\-bin/}-linux-amd64.zip")

sha256sums=('7a38582e05a09043d82599b36a29fedc22ab7f14e2ed63f50576933abc431fa4')

package() {
  install -Dm755 "${srcdir}/grape" "${pkgdir}/usr/bin/grape"
}
