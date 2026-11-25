# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=graph-tui-bin
pkgver=0.21.0
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
sha256sums_x86_64=('af04adc9646d49070eab593cbd1b8508b681ad4a2add2d9dcc8ffc7deeb1c736')

package() {
  install -Dm755 "graph-tui" "${pkgdir}/usr/bin/graph-tui"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
