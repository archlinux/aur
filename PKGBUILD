# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=tipctl
pkgname=tipctl-bin
pkgver=6.34.4
pkgrel=1
pkgdesc="The command line interface for the TransIP API"
arch=('any')
url="https://www.transip.nl/developers/"
license=('Apache')
depends=('php')
source=("${_pkgname}-${pkgver}.phar::https://github.com/transip/${_pkgname}/releases/download/v${pkgver}/${_pkgname}.phar")
sha512sums=('225b1d6f9ddf9b3cea862550b8798b21796cb3ba352d4a594b42c517cefcbe966fdba9b43df8050a4713edce0b3a235c41e3e380dc0e9b4179136b365197519a')

package() {
	install -Dm755 "${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
