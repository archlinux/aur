# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=ttt2
pkgver=1.16
pkgrel=2
pkgdesc="An automatic termination prover for term rewrite systems (TRS)"
arch=('i686' 'x86_64')
url="http://colo6-c703.uibk.ac.at/ttt2/"
license=('LGPL')
depends=('libxslt')
makedepends=('camlidl' 'ocaml')
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
md5sums=('7573fcb4e9432967ff4a7481a616c52a')
sha1sums=('1e05d0c4ecd8f33748df103a806e81c634c6168d')
sha256sums=('a8e2136ec3fcbf192db9e97569d9fd6b2a52f401bab99c71c55cbafc962db797')
