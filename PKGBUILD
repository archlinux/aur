# Maintainer: Timo Kramer <fw [minus] aur [at] timokramer [dot] de>
# Contributor: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=neil
pkgver=0.2.62
pkgrel=1
pkgdesc='A CLI to add common aliases and features to deps.edn-based projects for the Clojure language.'
arch=('x86_64')
url='https://github.com/babashka/neil'
license=('MIT')
provides=('neil')
conflicts=()
depends=('babashka')

source=("https://github.com/babashka/neil/archive/refs/tags/v${pkgver}.zip")

sha256sums=('faeaebab1b59490dde471cca96e93c594329d777c922710a8d4b5a21fbe8c4df')

package() {
  install -Dm755 "${srcdir}/neil-${pkgver}/neil" "${pkgdir}/usr/bin/neil"
}
