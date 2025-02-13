# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.94.0
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
b2sums=('1b0da6935a4c5d449798230796ace7eccc72fd1cb51138c98e7845c2bdf3b4e53dec454c085145f4ec55dafdd8fe655537310841edc59eaf12595bc2c0ce778b')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
