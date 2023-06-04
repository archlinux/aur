# Maintainer: Padraic Fanning <fanninpm at miamioh dot edu>

pkgname=lean-community-bin
pkgver=3.51.1
pkgrel=1
pkgdesc='Lean Theorem Prover, maintained by the Lean community'
arch=('x86_64')
url="https://github.com/leanprover-community/lean"
license=('Apache')
depends=()
makedepends=()
conflicts=('lean-bin' 'lean-git' 'lean3-bin' 'lean2-git' 'lean-community')
provides=('lean-community')
source=("https://github.com/leanprover-community/lean/releases/download/v${pkgver}/lean-${pkgver}-linux.tar.gz")
sha256sums=('34c6e65d90f6b9161b2b5acdfb24baf8f3d59ec20d5090ba9688bf8a9b0765aa')

package() {
  cd $srcdir/lean-${pkgver}-linux
  mkdir -p $pkgdir/usr/bin
  cp -r bin/* $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
  cp -r lib/* $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include
  cp -r include/* $pkgdir/usr/include
}
