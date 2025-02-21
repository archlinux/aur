# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.95.0
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
b2sums=('5012ddb9a1bdab167baf22f8ea1728f6e30a444988db26bb9c887dbae879f728eca4ccb2b6deb74d51ce1de52f4274ed4d618e7264bb70f5f9620d6c1c1ac2e7')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
