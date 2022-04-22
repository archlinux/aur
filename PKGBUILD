# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=clojure-query-bin
pkgver=2022.01.26_15.35.00
pkgrel=1
pkgdesc='cq is a Command-line Data Processor for EDN, YAML, JSON, XML and other data formats.'
arch=('x86_64')
url='https://github.com/markus-wa/cq'
license=('EPL')
provides=('clojure-query')
conflicts=()

source=("https://github.com/markus-wa/cq/releases/download/${pkgver/_/-}/cq-native-linux")

sha256sums=('1dd31358047d65848ed037010d0986f472c47ecac7c78f7d3acb9cf2c01c8fcd')

package() {
  install -Dm755 "${srcdir}/cq-native-linux" "${pkgdir}/usr/bin/cq"
}
