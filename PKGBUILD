# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=lean3-bin
pkgver=3.4.2
pkgrel=1
pkgdesc="Lean Theorem Prover"
arch=('x86_64')
url="https://github.com/leanprover/lean"
license=('Apache')
depends=()
makedepends=()
source=("https://github.com/leanprover/lean/releases/download/v3.4.2/lean-${pkgver}-linux.tar.gz")
md5sums=('b8f164b0af837b2597a4ca93fed331b2')

package() {
	cd $srcdir/lean-${pkgver}-linux
  mkdir -p $pkgdir/usr/bin
  cp -r bin/* $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
  cp -r lib/* $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include
  cp -r include/* $pkgdir/usr/include
}
