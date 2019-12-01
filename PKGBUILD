# Maintainer: Arthur Williams <taaparthur@gmail.com>

pkgname='indent-sort'
pkgver='1.0'
_language='en-US'
pkgrel=0
pkgdesc='Sort text with respect to indentation'
url="https://github.com/TAAPArthur/indent-sort"
arch=('any')
license=('MIT')
depends=('python3')
source=("https://github.com/TAAPArthur/indent-sort/archive/v1.0.tar.gz")
md5sums=('81cc9604b30e89b045d738d113ac7e3a')

package() {
  cd "$pkgname-$pkgver"
  install -D -m 0755 "indent-sort.py" "$pkgdir/usr/bin/$pkgname"
}
