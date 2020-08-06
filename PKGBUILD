# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=tipctl
pkgname=tipctl-bin
pkgver=6.3.0
pkgrel=1
pkgdesc="The command line interface for the TransIP API"
arch=('any')
url="https://www.transip.nl/developers/"
license=('Apache')
depends=('php')
source=("${_pkgname}-${pkgver}.phar::https://github.com/transip/${_pkgname}/releases/download/v${pkgver}/${_pkgname}.phar")
sha512sums=('1c1e5784d4eef2ba22d120106cff013700496b39909aa7b3c45f888326b62e845fd1494e314020afbfab5af2ba2ddf75cd2fbf3ca8cecc0ce5b0b5bf52d89d8d')

package() {
	install -Dm755 "${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
