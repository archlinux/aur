# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=spire-bin
pkgver=0.1.0_alpha.10
pkgrel=1
pkgdesc='A Clojure domain specific language tailored to idempotently orchestrate machines in parallel over SSH.'
arch=('x86_64')
url='https://github.com/epiccastle/spire'
license=('EPL')
provides=('spire')
conflicts=()

source=("https://github.com/epiccastle/spire/releases/download/v${pkgver/_/-}/${pkgname/\-bin/}-${pkgver/_/-}-linux-amd64.tgz")

sha256sums=('96f84b5b5641159a39e66a8ad1c2697df0dd267b6a5fa74c3497761b48ec8611')

package() {
  install -Dm755 "${srcdir}/spire" "${pkgdir}/usr/bin/spire"
}
