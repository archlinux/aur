# Maintainer: Timo Kramer <fw [minus] aur [at] timokramer [dot] de>
# Contributor: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=neil
pkgver=0.2.63
pkgrel=1
pkgdesc='A CLI to add common aliases and features to deps.edn-based projects for the Clojure language.'
arch=('x86_64')
url='https://github.com/babashka/neil'
license=('MIT')
provides=('neil')
conflicts=()
depends=('babashka')

source=("https://github.com/babashka/neil/archive/refs/tags/v${pkgver}.zip")

sha256sums=('534f7e7d82de7bb6ace3dcb783c6a8ef9cc6975d02ad9b84ebb8a66d21290974')

package() {
  install -Dm755 "${srcdir}/neil-${pkgver}/neil" "${pkgdir}/usr/bin/neil"
}
