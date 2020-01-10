# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=dad-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='Dad is a small configuration management tool for Clojure. This project is heavily inspired by mitamae.'
arch=('x86_64')
url='https://github.com/liquidz/dad'
license=('EPL')
provides=('dad-bin')
conflicts=('dad-bin')

source=("https://github.com/liquidz/dad/releases/download/${pkgver/_/-}/${pkgname/\-bin/}.linux-amd64")

sha256sums=('5fcf7dc5646f12b8a911a0976c8c8e654c15c084baabde4f8791bd6130fc7d7e')

package() {
  install -Dm755 "${srcdir}/dad.linux-amd64" "${pkgdir}/usr/bin/dad"
}