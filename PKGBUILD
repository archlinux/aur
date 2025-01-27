# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.90.0
pkgrel=1
pkgdesc='CLI for interacting with the Replicated Vendor API'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url="https://github.com/${_pkgname}hq/$_pkgname"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_${_goos}_${_goarch}.tar.gz")
b2sums=('e255fe25e14a0b5148d2645be8c372a82df6d0410240ca8d0aa7366806d544f1ae6009aaad9026c506d273e69e11598a751eff0d876bb26a6c8579f23e6a3593')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
