# Maintainer: Ben Boyter <ben@boyter.org>
pkgname=scc-bin
pkgver=3.2.0
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
  '7568bbb2b549ac3c893a6d5efa86d256c892b248399ee33ad4ef26f30febabc5'
)
source_x86_64=(
  https://github.com/boyter/scc/releases/download/v$pkgver/scc_Linux_x86_64.tar.gz
)
sha256sums_x86_64=(
  '975446e993cdd0a0193084ba43b13d290a48d4510c9210d788046b9a10acf609'
)
source_aarch64=(
  https://github.com/boyter/scc/releases/download/v$pkgver/scc_Linux_arm64.tar.gz
)
sha256sums_aarch64=(
  'ab7216b947c5ad9780edbb77785a5c5d83684543de905f6ec50510413097ae7b'
)

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  cp $srcdir/scc $pkgdir/usr/bin
}
