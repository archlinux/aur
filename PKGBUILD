# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.88.0
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
b2sums=('7efb71cf82a0e05570c7c3762bba4e98a34604ec6149e3bdad08b01370e214ad163e34b774773f77ccab4bd52b3c37846f9041d42ba86d58de993aaf252d3a9a')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
