# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.114.0
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
b2sums=('f4e443130199d1716249de03ad52c19b436bce07ff4b53d258c44d9ba9a7b141f0e04c572a4dbe5a6bc25e2fd1e66280828bfd721559ba3cac4dd16a8b12014c')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
