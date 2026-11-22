# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=graph-tui-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="A terminal graph editor with an infinite canvas, orthogonal edge routing and vim-like keys"
arch=('x86_64')
url="https://github.com/mixsoulgithub/graph-tui"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/graph-tui-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('819a7bd5097d21caed6ac17b0cdfd1b38d6df9b7b736aaa9992a0be290e75b32')

package() {
  install -Dm755 "graph-tui" "${pkgdir}/usr/bin/graph-tui"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
