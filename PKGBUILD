# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.31.0
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
b2sums=(8daf1c43a4bd1ca3af09fc46e57e91bc30f70b105b4e94679374dfd322caee91b0c8954e1b82623bd1d8c61e7504fc54662b3812413c7c24315b70ef6b9db09a)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
