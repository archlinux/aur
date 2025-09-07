# Maintainer: Your Name <your.email@example.com>
pkgname=clang-include-graph-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool to generate include dependency graphs for C/C++ projects."
arch=('x86_64')
url="https://github.com/bkryza/clang-include-graph"
license=('MIT')
depends=('gcc-libs' 'glibc' 'clang' 'boost-libs')
source=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/ViktorTrojan/clang-include-graph/releases/download/${pkgver}/clang-include-graph-${pkgver}-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/clang-include-graph" "${pkgdir}/usr/bin/clang-include-graph"
  # install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}