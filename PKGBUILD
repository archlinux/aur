# Maintainer: Padraic Fanning <fanninpm at miamioh dot edu>

pkgname=lean-community-bin
pkgver=3.40.0
pkgrel=1
pkgdesc='Lean Theorem Prover, maintained by the Lean community'
arch=('x86_64')
url="https://github.com/leanprover-community/lean"
license=('Apache')
depends=()
makedepends=()
conflicts=('lean-bin' 'lean-git' 'lean3-bin' 'lean2-git' 'lean-community')
source=("https://github.com/leanprover-community/lean/releases/download/v${pkgver}/lean-${pkgver}-linux.tar.gz")
sha256sums=('b6b51ee571d7103b9d5ce27f9a3a311c0e047bd4f1f0471e70af4db7ffa83887')

package() {
  cd $srcdir/lean-${pkgver}-linux
  mkdir -p $pkgdir/usr/bin
  cp -r bin/* $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
  cp -r lib/* $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include
  cp -r include/* $pkgdir/usr/include
}
