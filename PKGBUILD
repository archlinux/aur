# Maintainer: Ben Boyter <ben@boyter.org>
pkgname=scc-bin
pkgver=3.0.0
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
  '394715fd981d15253bdc4677286abfce01da356040381a0d9de7701bd7c8069c'
  'd908d07917d876a2b5fc96986acbf41f1ce73e43379ed9c4c9a8d86009bf7759'
)
source_x86_64=(
  'https://raw.githubusercontent.com/boyter/scc/master/LICENSE'
  https://github.com/boyter/scc/releases/download/v$pkgver/scc-$pkgver-x86_64-unknown-linux.zip
)
sha256sums_x86_64=(
  '394715fd981d15253bdc4677286abfce01da356040381a0d9de7701bd7c8069c'
  '13ca47ce00b5bd032f97f3af7aa8eb3c717b8972b404b155a378b09110e4aa0c'
)

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  cp $srcdir/scc $pkgdir/usr/bin
}
