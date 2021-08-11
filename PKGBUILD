# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.36.2
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
b2sums=(8d79fd93934ebfcb571dfdb9a21e53ceeba486e4b736b348693dc497c3115c735d92abd6597c862e629528e8043ef55d0f7c72931845cb175c397bf96540ad0c)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
