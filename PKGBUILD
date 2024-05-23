# Maintainer: Timo Kramer <fw [minus] aur [at] timokramer [dot] de>
# Contributor: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=neil
pkgver=0.3.65
pkgrel=1
pkgdesc='A CLI to add common aliases and features to deps.edn-based projects for the Clojure language.'
arch=('x86_64')
url='https://github.com/babashka/neil'
license=('MIT')
provides=('neil')
conflicts=()
depends=('babashka')

source=("https://github.com/babashka/neil/archive/refs/tags/v${pkgver}.zip")

sha256sums=('f996a1a7949b74e145572313ea22548aa58398e47f7ea6e24ccec4baaf805864')

package() {
  install -Dm755 "${srcdir}/neil-${pkgver}/neil" "${pkgdir}/usr/bin/neil"
}
