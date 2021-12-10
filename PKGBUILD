# Maintainer: 5amu <v.casalino@protonmail.com>
pkgname=staresc
pkgver=0
pkgrel=1
_version="${pkgver}.${pkgrel}"
pkgdesc="Make SSH/TNT PTs Great Again!"
arch=( 'any' )
url="https://gitlab.com/5amu/staresc"
license=( 'GPLv3' )
depends=( 'python' 'python-paramiko' )
source=($pkgname-$_version.tar.gz::https://gitlab.com/5amu/$pkgname/-/archive/$_version/$pkgname-$_version.tar.gz)
sha256sums=('03c1242e94b566667c49fd6c7c750b8aab7afb8ad8b2454914dc56f23dec2ebb')

package() {
	cd "$srcdir/$pkgname-$_version"
	make prefix="$pkgdir" install
}
