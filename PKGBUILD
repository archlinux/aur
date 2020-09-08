# Maintainer: Arthur Williams <taaparthur@gmail.com>

pkgname='indent-sort'
pkgver='1.1'
_language='en-US'
pkgrel=1
pkgdesc='Sort text with respect to indentation'
url="https://github.com/TAAPArthur/indent-sort"
arch=('any')
license=('MIT')
depends=(python)
source=("https://github.com/TAAPArthur/indent-sort/archive/v1.1.tar.gz")
md5sums=("77f7f4277640a3429e8cba6a30b2974a")

package() {
  cd "$pkgname-$pkgver"
  DESTDIR=$pkgdir make install
}
