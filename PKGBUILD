# Maintainer: PKQYPKJ <pkqypkj@outlook.com>
# Maintainer: VeryBaaad <verybaaad@outlook.com>

_pkgname=randfill
pkgname=$_pkgname-bin
_pkgver=0.2.0
pkgver=$_pkgver.r0.0341655
pkgrel=2
pkgdesc="Overwrite files with cryptographically secure random data"
arch=('x86_64')
url="https://github.com/OpenHelloMiddle/RandFill"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname-git")
options=('!debug')
source=("$_pkgname::https://github.com/OpenHelloMiddle/RandFill/releases/download/${_pkgver}/RandFill-x86_64-Linux")
sha256sums=('600f4611ecfc7cc16b8640a6d2c9295f5f0c7a6603e10b48da96891af08f2d87')

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
}
