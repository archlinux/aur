# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.27.0
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
sha256sums=(b63b1566d2b5bfed2c4c2b912b4a3394ea1859ab40b6c52a5cf3c475fb1315f9)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
