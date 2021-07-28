# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=saml2aws-bin
_pkgname="${pkgname%-bin}"
pkgver=2.32.0
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
b2sums=(0862cd7551964e5111c29372c576080f0b90dddd272052daa5e2df9345c10107975d891e679b579980d75a86592cff0634722b9f16cd2d2f02a1fa748f3570e0)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
