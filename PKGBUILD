# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=spire-bin
pkgver=0.1.0_alpha.9
pkgrel=1
pkgdesc='A Clojure domain specific language tailored to idempotently orchestrate machines in parallel over SSH.'
arch=('x86_64')
url='https://github.com/epiccastle/spire'
license=('EPL')
provides=('spire')
conflicts=()

source=("https://github.com/epiccastle/spire/releases/download/v${pkgver/_/-}/${pkgname/\-bin/}-${pkgver/_/-}-linux-amd64.tgz")

sha256sums=('dd93d93131e5e8c286eed13ba72820fa01ef52057d3c7c48c7e46aba2f082cbe')

package() {
  install -Dm755 "${srcdir}/spire" "${pkgdir}/usr/bin/spire"
}
