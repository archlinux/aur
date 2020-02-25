# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=dad-bin
pkgver=0.2.4
pkgrel=1
pkgdesc='Dad is a small configuration management tool for Clojure. This project is heavily inspired by mitamae.'
arch=('x86_64')
url='https://github.com/liquidz/dad'
license=('EPL')
provides=('dad')
conflicts=()

source=("https://github.com/liquidz/dad/releases/download/${pkgver}/${pkgname/\-bin/}.linux-amd64")

sha256sums=('878dd35bf9862a39e57f6a8b6a904399e24c0b5dd565b905baa69c480945ce38')

package() {
  install -Dm755 "${srcdir}/dad.linux-amd64" "${pkgdir}/usr/bin/dad"
}