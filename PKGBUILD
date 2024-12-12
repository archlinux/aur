# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.85.0
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
b2sums=('d77d6e815f5c83c9a7eaa9eff636c2cb9565bb83aed8a62d7976ec1df3854252295e81b215f3966f105a2a9a296659feee131f4a2ec6c53188019e94a3bf0f73')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
