# Maintainer: alienzj <alienchuj@gmail.com>

pkgname=seqtk
pkgver=1.3
pkgrel=1
pkgdesc="Toolkit for processing sequences in FASTA/Q formats"
arch=('i686' 'x86_64')
url="https://github.com/lh3/seqtk"
license=('MIT')
makedepends=('zlib')
provides=('seqtk')
conflicts=('seqtk')
source=("https://github.com/lh3/seqtk/archive/v1.3.tar.gz")
md5sums=('39a499431a10fe2412925a53ecfbab2b')

pkgver() {
  cd $srcdir/seqtk-1.3
  echo 1.3
}

build() {
  cd $srcdir/seqtk-1.3
  make
}

package() {
  cd $srcdir/seqtk-1.3
  install -Dm755 seqtk $pkgdir/usr/bin/seqtk
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/seqtk/LICENSE
}
