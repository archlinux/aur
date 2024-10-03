# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=tipctl
pkgname=tipctl-bin
pkgver=6.34.1
pkgrel=1
pkgdesc="The command line interface for the TransIP API"
arch=('any')
url="https://www.transip.nl/developers/"
license=('Apache')
depends=('php')
source=("${_pkgname}-${pkgver}.phar::https://github.com/transip/${_pkgname}/releases/download/v${pkgver}/${_pkgname}.phar")
sha512sums=('ac8fb48a83de9a4e24e474df927efcef86d88d59d30435f4698a3d3b50299ac92bd72a4f4356b3688d0f7783105953297835a0000a33106c5430685f8dcd0947')

package() {
	install -Dm755 "${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
