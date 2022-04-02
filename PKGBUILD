# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=spire-bin
pkgver=0.1.0_alpha.18
pkgrel=1
pkgdesc='A Clojure domain specific language tailored to idempotently orchestrate machines in parallel over SSH.'
arch=('x86_64')
url='https://github.com/epiccastle/spire'
license=('EPL')
provides=('spire')
conflicts=()

source=("https://github.com/epiccastle/spire/releases/download/v${pkgver/_/-}/${pkgname/\-bin/}-${pkgver/_/-}-linux-amd64.tgz")

sha256sums=('f9ef9cbf48e6e8e100dd6bd6607b46920c8b10bb3d6cc2b85636b24b388f02ba')

package() {
  install -Dm755 "${srcdir}/spire" "${pkgdir}/usr/bin/spire"
}
