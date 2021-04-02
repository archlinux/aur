# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.28.4
pkgrel=1
pkgdesc='CLI tool to login and retrieve AWS temporary credentials using a SAML IDP'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://github.com/Versent/saml2aws'
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/versent/$_pkgname/releases/download/v$pkgver/saml2aws_${pkgver}_${_goos}_${_goarch}.tar.gz")
sha256sums=(d29eff4f1a76f0ad2099910086babdd8ba01a756582407c61b6c62a00e368236)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
