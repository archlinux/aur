# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=dad-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='Dad is a small configuration management tool for Clojure. This project is heavily inspired by mitamae.'
arch=('x86_64')
url='https://github.com/liquidz/dad'
license=('EPL')
provides=('dad')
conflicts=()

source=("https://github.com/liquidz/dad/releases/download/${pkgver}/${pkgname/\-bin/}.linux-amd64")

sha256sums=('b7eb5fadc04a24747a1281926f8bd8227ad7ad0454d67175c476b75c3eebf6da')

package() {
  install -Dm755 "${srcdir}/dad.linux-amd64" "${pkgdir}/usr/bin/dad"
}
