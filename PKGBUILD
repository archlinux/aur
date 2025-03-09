# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.96.0
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
b2sums=('abbe54b9a6916e14f0c355c64514b941f2cc2231cec2fbbf8c41e7d315acb9ed5b5ed0990da6f8884001986f22ebf4ed49847cd6c44ec8ae7d849c5dc0ceb6fd')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
