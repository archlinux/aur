# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.34.0
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
b2sums=(65a197c66e38b50baf9160179de167d4a0bc0224bb42ea2298a4b7354691aa787e7d0d5933c58da690b7e3e0fa44413a1a999cdddeee5dfbeff4b21f079d5ff5)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
