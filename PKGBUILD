# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.24.0
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
sha256sums=('f5e0dd74b4ed397e9ec354b386e27aee130c1ee1c14f6273f458d729718cfd36')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
