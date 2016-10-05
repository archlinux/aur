# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=ttt2
pkgver=1.16
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
md5sums=('45ae062e8e7cea5f6ebc6aea97257bba')
sha1sums=('48dd94ea0fc3d3b95d3686e34c8bd80f27d64697')
sha256sums=('5461fd55eb54217c24c18028f2b8aecd5de028176d9ef6d6199488fab4bd87b6')
