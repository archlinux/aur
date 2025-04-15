# Maintainer: Ben Boyter <ben@boyter.org>
pkgname=scc-bin
pkgver=3.5.0
pkgrel=2
pkgdesc="Sloc, Cloc and Code: scc is a very fast accurate code counter with complexity calculations and COCOMO estimates written in pure Go"
arch=('x86_64' 'i386' 'aarch64')
url="https://github.com/boyter/scc"
license=('MIT' 'UNLICENSE')
conflicts=('scc')
provides=("scc=${pkgver}")
source_i386=(
  "${pkgname}-v${pkgver}-i386.tar.gz::https://github.com/boyter/scc/releases/download/v$pkgver/scc_Linux_i386.tar.gz"
)
sha256sums_i386=(
  'a296012728ab727d54db59f341f300c4f226869d8b53133df0f28e0e9403b448'
)
source_x86_64=(
  "${pkgname}-v${pkgver}-x86_64.tar.gz::https://github.com/boyter/scc/releases/download/v$pkgver/scc_Linux_x86_64.tar.gz"
)
sha256sums_x86_64=(
  '6c31f4d0cf3b7a8c5ca910fa4e451949434798f6541ec5dea4b83f4973e13772'
)
source_aarch64=(
  "${pkgname}-v${pkgver}-arm64.tar.gz::https://github.com/boyter/scc/releases/download/v$pkgver/scc_Linux_arm64.tar.gz"
)
sha256sums_aarch64=(
  '64446b1ca954aa1ac34984bbb4f098f46e6c69c84d64a7d096275ea6e50461eb'
)

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  cp $srcdir/scc $pkgdir/usr/bin
}
