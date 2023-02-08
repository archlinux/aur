# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=neil
pkgver=0.1.55
pkgrel=2
pkgdesc='A CLI to add common aliases and features to deps.edn-based projects for the Clojure language.'
arch=('x86_64')
url='https://github.com/babashka/neil'
license=('MIT')
provides=('neil')
conflicts=()
depends=('babashka')

source=("https://github.com/babashka/neil/archive/refs/tags/v${pkgver}.zip")

sha256sums=('6b7c245062e795a1b399d63211501479096c95c8f9ac59de09b2a5fc3007af2d')

package() {
  install -Dm755 "${srcdir}/neil-${pkgver}/neil" "${pkgdir}/usr/bin/neil"
}
