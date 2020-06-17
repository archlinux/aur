# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=spire-bin
pkgver=0.1.0_alpha.13
pkgrel=2
pkgdesc='A Clojure domain specific language tailored to idempotently orchestrate machines in parallel over SSH.'
arch=('x86_64')
url='https://github.com/epiccastle/spire'
license=('EPL')
provides=('spire')
conflicts=()

source=("https://github.com/epiccastle/spire/releases/download/v${pkgver/_/-}/${pkgname/\-bin/}-${pkgver/_/-}-linux-amd64.tgz")

sha256sums=('1b637b76b3319afe93ebb0c9e58c62ecbe06e1d8c80f2592973b4d5d3959a273')

package() {
  install -Dm755 "${srcdir}/spire" "${pkgdir}/usr/bin/spire"
}
