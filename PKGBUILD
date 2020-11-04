# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=grape-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='Grape is a syntax-aware grep-like utility for Clojure code. It allows you to search for code patterns using Clojure data structures.'
arch=('x86_64')
url='https://github.com/bfontaine/grape'
license=('EPL')
provides=('grape')
conflicts=()

source=("https://github.com/bfontaine/grape/releases/download/${pkgver}/${pkgname/\-bin/}-linux-amd64.zip")

sha256sums=('92c5a64596d78c09ca4abaf0c60c0df4610aab7538109f4f71717d3975ec70b1')

package() {
  install -Dm755 "${srcdir}/grape" "${pkgdir}/usr/bin/grape"
}
