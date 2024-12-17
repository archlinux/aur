# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.86.0
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
b2sums=('b0265e81e4624bf069dc70110202af906084520e125d6ce158774602095026639726ed1713cb65f83785e1adb8984815a1fa6cde23739de84c06febc942401b3')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
