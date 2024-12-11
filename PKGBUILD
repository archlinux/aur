# Maintainer: Timo Kramer <fw [minus] aur [at] timokramer [dot] de>
# Contributor: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=neil
pkgver=0.3.68
pkgrel=1
pkgdesc='A CLI to add common aliases and features to deps.edn-based projects for the Clojure language.'
arch=('x86_64')
url='https://github.com/babashka/neil'
license=('MIT')
provides=('neil')
conflicts=()
depends=('babashka')

source=("https://github.com/babashka/neil/archive/refs/tags/v${pkgver}.zip")

sha256sums=('cd6e0c2662d4d2f70e1d3c94d92c11d62110a4f73da6db4e42ce3664abf412e5')

package() {
  install -Dm755 "${srcdir}/neil-${pkgver}/neil" "${pkgdir}/usr/bin/neil"
}
