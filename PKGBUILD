# Maintainer: Ben Boyter <ben@boyter.org>
pkgname=scc-bin
pkgver=3.3.5
pkgrel=1
pkgdesc="Sloc, Cloc and Code: scc is a very fast accurate code counter with complexity calculations and COCOMO estimates written in pure Go"
arch=('x86_64' 'i386' 'aarch64')
url="https://github.com/boyter/scc"
license=('MIT' 'UNLICENSE')
conflicts=('scc')
source_i386=(
  https://github.com/boyter/scc/releases/download/v$pkgver/scc_Linux_i386.tar.gz
)
sha256sums_i386=(
  '2516e4a1762329b6fe450fc4e6721cf6657e705d66a94ce476fcc79969fd7aba'
)
source_x86_64=(
  https://github.com/boyter/scc/releases/download/v$pkgver/scc_Linux_x86_64.tar.gz
)
sha256sums_x86_64=(
  'd6c00adae232e8949e5426268a17ece9c1cb55b4f628c413bdf018c45ee78cd8'
)
source_aarch64=(
  https://github.com/boyter/scc/releases/download/v$pkgver/scc_Linux_arm64.tar.gz
)
sha256sums_aarch64=(
  'd6c00adae232e8949e5426268a17ece9c1cb55b4f628c413bdf018c45ee78cd8'
)

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  cp $srcdir/scc $pkgdir/usr/bin
}
