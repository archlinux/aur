# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.119.0
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
b2sums=('43248b8c5cc45c1afd2f492e58a889c8314e014ba82290277c6823be80c6fdf76013218b561ed7ecf7d3da35327030d996d39f2e2dd69f4210fed8c0e2662bb2')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
