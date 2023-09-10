# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=neil
pkgver=0.1.60
pkgrel=2
pkgdesc='A CLI to add common aliases and features to deps.edn-based projects for the Clojure language.'
arch=('x86_64')
url='https://github.com/babashka/neil'
license=('MIT')
provides=('neil')
conflicts=()
depends=('babashka')

source=("https://github.com/babashka/neil/archive/refs/tags/v${pkgver}.zip")

sha256sums=('c2b518dd20a756df93ad49fcceaf6cebb7bc61baee0ad9bc4de8329fdd910806')

package() {
  install -Dm755 "${srcdir}/neil-${pkgver}/neil" "${pkgdir}/usr/bin/neil"
}
