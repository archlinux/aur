# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=clojure-query-bin
pkgver=2022.08.29_21.25.40
pkgrel=1
pkgdesc='cq is a Command-line Data Processor for EDN, YAML, JSON, XML and other data formats.'
arch=('x86_64')
url='https://github.com/markus-wa/cq'
license=('EPL')
provides=('clojure-query')
conflicts=()

source=("https://github.com/markus-wa/cq/releases/download/${pkgver/_/-}/cq-native-linux")

sha256sums=('8b633feef9068eff47edc26d33f954c7afa717b2c963359196fb806c79f25eab')

package() {
  install -Dm755 "${srcdir}/cq-native-linux" "${pkgdir}/usr/bin/cq"
}
