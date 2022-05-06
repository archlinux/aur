# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=neil
pkgver=0.0.28
pkgrel=1
pkgdesc='A CLI to add common aliases and features to deps.edn-based projects for the Clojure language.'
arch=('x86_64')
url='https://github.com/babashka/neil'
license=('MIT')
provides=('neil')
conflicts=()
depends=('babashka')

source=("https://github.com/babashka/neil/archive/refs/tags/v${pkgver}.zip")

sha256sums=('6a1080a010ab365aef8a3b9f17a47855a24cdede67413ce14595368916181ea7')

package() {
  install -Dm755 "${srcdir}/neil-${pkgver}/neil" "${pkgdir}/usr/bin/neil"
}
