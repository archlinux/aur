# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=tipctl
pkgname=tipctl-bin
pkgver=6.35.0
pkgrel=1
pkgdesc="The command line interface for the TransIP API"
arch=('any')
url="https://www.transip.nl/developers/"
license=('Apache-2.0')
depends=('php')
source=("${_pkgname}-${pkgver}.phar::https://github.com/transip/${_pkgname}/releases/download/${pkgver}/${_pkgname}.phar")
sha512sums=('d57891a16f8a4edee4fc75bbb9ef27f15681ae8006c44e2ad355bd44cbf89e622a25cb89c43a224428e92a773d56b2ef55742e43d92dd53974fcc0291488a37b')

package() {
	install -Dm755 "${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
