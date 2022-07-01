# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.39.4
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
b2sums=('3e36bafb3530f784e19d8abb61c62341338d0cd470385b7fca1973aeb304d5b5031d305b95f0404b491f1067d1240c4eda3c67ecb8c74cfa1e5c2dca133e57e1')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
