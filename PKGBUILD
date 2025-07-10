# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.108.0
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
b2sums=('2ddbae93c32c06b5032969847aa555c7e9ae3559d0c59f2b26c39610ca443e67ed726a708bb54e19309fc2856ae45719390ff5abfecc961b557a38f6f60b4def')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
