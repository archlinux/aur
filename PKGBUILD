# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=homemgr
pkgver=1.0
pkgrel=1
pkgdesc="Manager of home directories in Linux."
arch=('any')
url='https://github.com/BiteDasher/homemgr'
license=('MIT')
depends=('bash' 'sed' 'coreutils' 'shadow' 'e2fsprogs' 'glibc' 'tar')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/homemgr/archive/${pkgver}.tar.gz")
sha256sums=("bab219c73722ce255157192f14c88cb9584a53ef0a3b13391864cd5cf85c79c3")
package() {
install -Dm 755 $srcdir/$pkgname-$pkgver/homemgr $pkgdir/usr/bin/$pkgname
}
