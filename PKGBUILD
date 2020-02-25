# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=jet-bin
pkgver=0.0.12
pkgrel=1
pkgdesc='CLI to transform between JSON, EDN and Transit, powered with a minimal query language.'
arch=('x86_64')
url='https://github.com/borkdude/jet'
license=('EPL')
provides=('jet')
conflicts=()

source=("https://github.com/borkdude/jet/releases/download/v${pkgver}/${pkgname/\-bin/}-${pkgver}-linux-amd64.zip")

sha256sums=('6e6512b41a109136bba78ed66d8edd657715e0a7bae08660ddfa9e16da65782f')

package() {
  install -Dm755 "${srcdir}/jet" "${pkgdir}/usr/bin/jet"
}