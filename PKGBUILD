# Maintainer: Ben Boyter <ben@boyter.org>
pkgname=scc-bin
pkgver=2.13.0
pkgrel=2
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
  'b475b9baf9c6bacc41f0b907eb99c8b023bb923c3913d5a334d606861e25704e'
)
source_x86_64=(
  'https://raw.githubusercontent.com/boyter/scc/master/LICENSE'
  https://github.com/boyter/scc/releases/download/v$pkgver/scc-$pkgver-x86_64-unknown-linux.zip
)
sha256sums_x86_64=(
  '394715fd981d15253bdc4677286abfce01da356040381a0d9de7701bd7c8069c'
  'b49d030ce8280252b5928946ee1d7006dd80c6b662bd99ee3fe16af411d80b3c'
)

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  cp $srcdir/scc $pkgdir/usr/bin
}
