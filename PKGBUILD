# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=clojure-query-bin
pkgver=2022.10.12_14.51.05
pkgrel=1
pkgdesc='cq is a Command-line Data Processor for EDN, YAML, JSON, XML and other data formats.'
arch=('x86_64')
url='https://github.com/markus-wa/cq'
license=('EPL')
provides=('clojure-query')
conflicts=()

source=("https://github.com/markus-wa/cq/releases/download/${pkgver/_/-}/cq-native-linux")

sha256sums=('4bbc46d74c6171a3c631d89116b834c69e90ba718eabcbe3b74a662304040474')

package() {
  install -Dm755 "${srcdir}/cq-native-linux" "${pkgdir}/usr/bin/cq"
}
