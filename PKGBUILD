# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.104.0
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
b2sums=('27ac8467da4cf26f34aeba2e31df2937008386365b8b17faba8609d0a580634767b9731bf99c921cef1b4d5ffcb1e6b0a48e9b97bf440a126a93eabbd9dfa005')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
