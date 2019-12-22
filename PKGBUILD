# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=jet-bin
pkgver=0.0.10
pkgrel=1
pkgdesc='CLI to transform between JSON, EDN and Transit, powered with a minimal query language.'
arch=('x86_64')
url='https://github.com/borkdude/jet'
license=('EPL')
provides=('jet-bin')
conflicts=('jet-bin')

source=("https://github.com/borkdude/jet/releases/download/v${pkgver/_/-}/${pkgname/\-bin/}-${pkgver/_/-}-linux-amd64.zip")

sha256sums=('264d5087fa30f3ef8b2d1d6d2391442147cedecfa4cc9da60a3911331547d3b4')

package() {
  install -Dm755 "${srcdir}/jet" "${pkgdir}/usr/bin/jet"
}