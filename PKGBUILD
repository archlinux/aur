# Maintainer: Ben Boyter <ben@boyter.org>
pkgname=scc-bin
pkgver=2.12.0
pkgrel=1
pkgdesc="Sloc, Cloc and Code: scc is a very fast accurate code counter with complexity calculations and COCOMO estimates written in pure Go"
arch=('x86_64' 'i386')
url="https://github.com/boyter/scc"
license=('MIT' 'UNLICENSE')
conflicts=('scc')
source_i386=(
  'https://raw.githubusercontent.com/boyter/scc/master/LICENSE'
  https://github.com/boyter/scc/releases/download/v$pkgver/scc-$pkgver-i386-unknown-linux.zip
)
sha256sums_i386=(
  '061aed9783047c2b7a4619c270161d2ea9344635fe340bf3a6ac2b1bc49638ea'
  '34a7115a2d003607afba5895d8e5fbf3508a4b8cfc6f2204b279e10103d3c010'
)
source_x86_64=(
  'https://raw.githubusercontent.com/boyter/scc/master/LICENSE'
  https://github.com/boyter/scc/releases/download/v$pkgver/scc-$pkgver-x86_64-unknown-linux.zip
)
sha256sums_x86_64=(
  '061aed9783047c2b7a4619c270161d2ea9344635fe340bf3a6ac2b1bc49638ea'
  '8eca3e98fe8a78d417d3779a51724515ac4459760d3ec256295f80954a0da044'
)

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  cp $srcdir/scc $pkgdir/usr/bin
}
