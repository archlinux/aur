# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=tipctl
pkgname=tipctl-bin
pkgver=6.33.3
pkgrel=1
pkgdesc="The command line interface for the TransIP API"
arch=('any')
url="https://www.transip.nl/developers/"
license=('Apache')
depends=('php')
source=("${_pkgname}-${pkgver}.phar::https://github.com/transip/${_pkgname}/releases/download/${pkgver}/${_pkgname}.phar")
sha512sums=('abb0736b3471639706741bd8d8d74ddb3cb05cda96186517c3ea416632aa289d7d5d4a21405f98def1f4e483f1435212dc182bc3235bfb749a6f604a37a1c2ef')

package() {
	install -Dm755 "${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
