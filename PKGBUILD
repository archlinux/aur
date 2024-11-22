# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.84.0
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
b2sums=('f810a141832a97a257c355f0b8bed468940293df84b4aef791a4c3de966912b1ecc02fd5b4132c776284dcb9633ff879d5d72f18f3c1eeadf56b47c0f7f95e93')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
