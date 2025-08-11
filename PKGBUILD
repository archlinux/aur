# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.110.0
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
b2sums=('a8a5e480cbaa87b4ec107a260cf0cfc4ae9e33c73cc44531928d889b971638c87960e65643d7b35965400a5aa1d46edd5cd61a65f00654708a60ab9c9a297166')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
