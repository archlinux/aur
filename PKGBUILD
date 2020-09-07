# Maintainer: Arthur Williams <taaparthur@gmail.com>

pkgname='indent-sort'
pkgver='1.1'
_language='en-US'
pkgrel=0
pkgdesc='Sort text with respect to indentation'
url="https://github.com/TAAPArthur/indent-sort"
arch=('any')
license=('MIT')
depends=(python python-argparse)
source=("https://github.com/TAAPArthur/indent-sort/archive/v1.1.tar.gz")
md5sums=("9fd9788a328226652a56ab39487a099a")

package() {
  cd "$pkgname-$pkgver"
  DESTDIR=$pkgdir make install
}
