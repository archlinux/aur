# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=tipctl
pkgname=tipctl-bin
pkgver=6.1.0
pkgrel=1
pkgdesc="The command line interface for the TransIP API"
arch=('any')
url="https://www.transip.nl/developers/"
license=('Apache')
depends=('php')
source=("${_pkgname}-${pkgver}.phar::https://github.com/transip/${_pkgname}/releases/download/v${pkgver}/${_pkgname}.phar")
sha512sums=('c09be6c4458882cb5de794741d9f72900459846aa4f992d55c99cf6d5c099e61529900a3a982c5922ad5ff204802d9aeee5d1dce6967c8a1a8bb28fb909634b9')

package() {
	install -Dm755 "${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
