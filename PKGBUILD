# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.123.0
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
b2sums=('dd44783f840d9a2c793e6193fb267675b3b2173ab71bb4d0dce118f0ce292cebb2859152fb675c9e4e4dddf0eb62f3fe564fdb214083ff09e6bfcead5a94b121')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
