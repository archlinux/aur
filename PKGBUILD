# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.118.0
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
b2sums=('4d703d6ea5cc37e02630e393095c097e6502cde5ec6392d19fac6434519075c35f22f08dde10350160e502ae03ae60adfc5ff5d91dc4dd2a7b93638a1e4055ca')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
