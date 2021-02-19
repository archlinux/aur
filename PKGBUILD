# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.33.8
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
sha256sums=(6b02f428adee73b47bf7d8991d62591202b00ce53696f7609c71ab3b73a5e260)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
