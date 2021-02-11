# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=dad-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='Dad is a small configuration management tool for Clojure. This project is heavily inspired by mitamae.'
arch=('x86_64')
url='https://github.com/liquidz/dad'
license=('EPL')
provides=('dad')
conflicts=()

source=("https://github.com/liquidz/dad/releases/download/${pkgver}/${pkgname/\-bin/}.linux-amd64")

sha256sums=('de25b10019e672a92939ba9e0bcd41d55e84ec1ea7d967c2dc57741060deac31')

package() {
  install -Dm755 "${srcdir}/dad.linux-amd64" "${pkgdir}/usr/bin/dad"
}
