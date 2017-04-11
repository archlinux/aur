# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=ttt2
pkgver=1.16.2
pkgrel=1
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
sha1sums=('563b0ff04fcaa3772f28716d11e5ec59e09e9e15')
sha256sums=('09c2328fa8f6b12df2fa8729a1238ad52b3251cc24c0308b629f00014332e04b')
