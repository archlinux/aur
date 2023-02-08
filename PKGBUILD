# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=neil
pkgver=0.1.55
pkgrel=1
pkgdesc='A CLI to add common aliases and features to deps.edn-based projects for the Clojure language.'
arch=('x86_64')
url='https://github.com/babashka/neil'
license=('MIT')
provides=('neil')
conflicts=()
depends=('babashka')

source=("https://github.com/babashka/neil/archive/refs/tags/v${pkgver}.zip")

sha256sums=('6ada91f7202a0f1b1f1d161ce09bc6e63df909432835e7149867f3b54ae59db2')

package() {
  install -Dm755 "${srcdir}/neil-${pkgver}/neil" "${pkgdir}/usr/bin/neil"
}
