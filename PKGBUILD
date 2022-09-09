# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=neil
pkgver=0.1.45
pkgrel=1
pkgdesc='A CLI to add common aliases and features to deps.edn-based projects for the Clojure language.'
arch=('x86_64')
url='https://github.com/babashka/neil'
license=('MIT')
provides=('neil')
conflicts=()
depends=('babashka')

source=("https://github.com/babashka/neil/archive/refs/tags/v${pkgver}.zip")

sha256sums=('da79491dfd29b84a1288979fa933cf879a70eb654887de4593c8eb3ecc0b17d7')

package() {
  install -Dm755 "${srcdir}/neil-${pkgver}/neil" "${pkgdir}/usr/bin/neil"
}
