# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=homemgr
pkgver=1.8.1
pkgrel=1
pkgdesc="Manager of home directories in Linux."
arch=('any')
url='https://github.com/BiteDasher/homemgr'
license=('MIT')
depends=('bash' 'sed' 'coreutils' 'shadow' 'tar')
optdepends=(
	'glibc: native getent command'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/homemgr/archive/${pkgver}.tar.gz")
sha256sums=("66d2603c552b7a72f91e6a74814ef04f2eb0b458f3fdc49905cbce39056908f5")
package() {
install -Dm 755 $srcdir/$pkgname-$pkgver/homemgr $pkgdir/usr/bin/$pkgname
}
