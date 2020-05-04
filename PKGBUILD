# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=ttt2
pkgver=1.20
pkgrel=1
pkgdesc="An automatic termination prover for term rewrite systems (TRS)"
arch=('i686' 'x86_64')
url="http://colo6-c703.uibk.ac.at/ttt2/"
license=('LGPL')
depends=('libxslt' 'gmp')
makedepends=('ocaml' 'ocaml-findlib' 'ocaml-num' 'camlidl')
source=(http://colo6-c703.uibk.ac.at/ttt2/download/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D ttt2 $pkgdir/usr/bin/ttt2
}

# vim:set ts=2 sw=2 et:
sha256sums=('144ed636276a179a610990fe45b9b849ffd0099b78c0a265a7d4d0e071f3cc18')
