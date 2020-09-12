# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=homemgr
pkgver=1.8.2
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
sha256sums=("5f6234936174003824bf05afb13dcd4c5c8300431368d8ce726f101d33621c5e")
package() {
install -Dm 755 $srcdir/$pkgname-$pkgver/homemgr $pkgdir/usr/bin/$pkgname
}
