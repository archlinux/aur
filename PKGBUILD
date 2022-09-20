# Maintainer: Ben Boyter <ben@boyter.org>
pkgname=scc-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Sloc, Cloc and Code: scc is a very fast accurate code counter with complexity calculations and COCOMO estimates written in pure Go"
arch=('x86_64' 'i386' 'aarch64')
url="https://github.com/boyter/scc"
license=('MIT' 'UNLICENSE')
conflicts=('scc')
source_i386=(
  https://github.com/boyter/scc/releases/download/v$pkgver/scc_${pkgver}_Linux_i386.tar.gz
)
sha256sums_i386=(
  'a62f4ac7b1bb18ab7e7e68311614914e2097c1244816c451a6857914c0894764'
)
source_x86_64=(
  https://github.com/boyter/scc/releases/download/v$pkgver/scc_${pkgver}_Linux_x86_64.tar.gz
)
sha256sums_x86_64=(
  '906ce2453690ca5de9e7dbb48f70cd2cedb9df7737c475ff9247b63454fc61b6'
)
source_aarch64=(
  https://github.com/boyter/scc/releases/download/v$pkgver/scc_${pkgver}_Linux_arm64.tar.gz
)
sha256sums_aarch64=(
  'ea65f05ce1d4486904ad2d0a19dcc5041c38908ff0fdcb86b83c54beb1f36d3f'
)

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  cp $srcdir/scc $pkgdir/usr/bin
}
