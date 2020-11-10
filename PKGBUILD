# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=grape-bin
pkgver=0.6.0
pkgrel=2
pkgdesc='Grape is a syntax-aware grep-like utility for Clojure code. It allows you to search for code patterns using Clojure data structures.'
arch=('x86_64')
url='https://github.com/bfontaine/grape'
license=('EPL')
provides=('grape')
conflicts=()

source=("https://github.com/bfontaine/grape/releases/download/${pkgver}/${pkgname/\-bin/}-linux-amd64.zip")

md5sums=('0091e1fff364c73fa39ad6d406ed6cf1')

package() {
  install -Dm755 "${srcdir}/grape" "${pkgdir}/usr/bin/grape"
}
