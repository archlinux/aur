# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=ttt2
pkgver=1.15
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
sha1sums=('36c05cf56372399a5bb480a7df50aa308fdc1841')
sha256sums=('ebe50cd81f6851abeb9046423fb55ef140c81656d5282a3ebe36433c5a93d7e2')
md5sums=('aaf7071b00a425a94df8dc213ffe03bf')
