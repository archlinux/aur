# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.33.0
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
b2sums=(a0c0c7f64064f5f0100e1e4ca54a99257ca887bea150b22494e1441793d8eb44b045951fbc6445452aa8b5e0f6d845cce6eeb1eb4d6ed4fab631793f9ef27711)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
