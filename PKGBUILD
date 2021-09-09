# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.37.2
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
b2sums=(c460123c81d7ce705d25076338e6f5fa3520eb49f7efb27a5f34d3aa2fe35ae5acd685b374d0979f6ac6d4a8e7fdd5901f2bd040383534c7d4e25ad938767b7b)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
