# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=homemgr
pkgver=1.1
pkgrel=1
pkgdesc="Manager of home directories in Linux."
arch=('any')
url='https://github.com/BiteDasher/homemgr'
license=('MIT')
depends=('bash' 'sed' 'coreutils' 'shadow' 'e2fsprogs' 'glibc' 'tar')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/homemgr/archive/${pkgver}.tar.gz")
sha256sums=("4e4e04b5032e4a9c46ea2981df084bc1e5db2d833838edc9bf18cf230f68a1e7")
package() {
install -Dm 755 $srcdir/$pkgname-$pkgver/homemgr $pkgdir/usr/bin/$pkgname
}
