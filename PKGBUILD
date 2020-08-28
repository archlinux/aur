# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=homemgr
pkgver=1.6
pkgrel=1
pkgdesc="Manager of home directories in Linux."
arch=('any')
url='https://github.com/BiteDasher/homemgr'
license=('MIT')
depends=('bash' 'sed' 'coreutils' 'shadow' 'e2fsprogs' 'tar')
optdepends=(
	'glibc: native getent command'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/homemgr/archive/${pkgver}.tar.gz")
sha256sums=("32854c752d39c1be25c216276ac96f9bc01069210f9ce7649fde1630aff21313")
package() {
install -Dm 755 $srcdir/$pkgname-$pkgver/homemgr $pkgdir/usr/bin/$pkgname
}
