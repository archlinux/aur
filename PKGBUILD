# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.128.0
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
b2sums=('c6a5cf2c4bc30970243c28b5d35f8ad0d0d1f66acf1c3b901ff06e92d54f39cd8bd53068b1f98570dd2d1ea0a2361bc6525ffdb5d9cfa1f49751075932623fc2')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
