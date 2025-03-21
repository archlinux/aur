# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.98.0
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
b2sums=('ee1aa34bdc596502eb0884bcddba6207e9d6610955f4fa31e0127f79ad9330ff79e7a02a28d45e76d85fe4591460ab6e3dc7dc6aef382c835385c53036964fcd')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
