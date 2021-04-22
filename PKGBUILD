# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.29.0
pkgrel=1
pkgdesc='CLI tool to login and retrieve AWS temporary credentials using a SAML IDP'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url="https://github.com/versent/$_pkgname"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_${_goos}_${_goarch}.tar.gz")
sha256sums=(06d0e70405a2c2e719759098523c97acb4c3afce4191d5e56e2db11e1ae3d8d6)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
