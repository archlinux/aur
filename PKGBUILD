# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=tipctl
pkgname=tipctl-bin
pkgver=6.4.0
pkgrel=1
pkgdesc="The command line interface for the TransIP API"
arch=('any')
url="https://www.transip.nl/developers/"
license=('Apache')
depends=('php')
source=("${_pkgname}-${pkgver}.phar::https://github.com/transip/${_pkgname}/releases/download/v${pkgver}/${_pkgname}.phar")
sha512sums=('ce88c763670e7feb3ccd81b98e3c265eb90783ed120d7e41b22e206a7157cb59b72eea165fac5ab49e22f0dcbe4a4519da656f4cc820fd9435a4329b2c2fa9ec')

package() {
	install -Dm755 "${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
