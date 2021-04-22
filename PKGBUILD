# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.36.1
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
sha256sums=(88113bff314f0a1f23dfafcf7ab8c375e616e6e9b24d2423e1058a9131d0ffd1)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
