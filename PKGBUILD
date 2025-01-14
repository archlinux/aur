# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.88.1
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
b2sums=('ce8a9eb5c0078a4f369659f1614ae6d0264b93999644b77e5d2b4b3dc025654d430f38e585f6001c1b054b74d3142da207d4ffec410a311dd076336ce990491a')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
