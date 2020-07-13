# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=spire-bin
pkgver=0.1.0_alpha.15
pkgrel=1
pkgdesc='A Clojure domain specific language tailored to idempotently orchestrate machines in parallel over SSH.'
arch=('x86_64')
url='https://github.com/epiccastle/spire'
license=('EPL')
provides=('spire')
conflicts=()

source=("https://github.com/epiccastle/spire/releases/download/v${pkgver/_/-}/${pkgname/\-bin/}-${pkgver/_/-}-linux-amd64.tgz")

sha256sums=('89ebfcc21b5f13f1fe0d2a0e500e5f1b595f77bd92880fa6142aa8c96fae5624')

package() {
  install -Dm755 "${srcdir}/spire" "${pkgdir}/usr/bin/spire"
}
