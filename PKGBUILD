# Maintainer: PKQYPKJ <pkqypkj@outlook.com>
# Maintainer: VeryBaaad <verybaaad@outlook.com>

_pkgname=randfill
pkgname=$_pkgname-bin
_pkgver=0.1.1
pkgver=$_pkgver.r0.f3f2e71
pkgrel=1
pkgdesc="Overwrite files with cryptographically secure random data"
arch=('x86_64')
url="https://github.com/OpenHelloMiddle/RandFill"
license=('GPL')
provides=("$_pkgname")
conflicts=("$_pkgname-git")
options=('!debug')
source=("$_pkgname::https://github.com/OpenHelloMiddle/RandFill/releases/download/${_pkgver}/RandFill-x86_64-Linux")
sha256sums=('f58890eaa56336ef7907092556578352025975368bcb3eafbae844a560a5a7dc')

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
}
