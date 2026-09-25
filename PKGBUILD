# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=ia
pkgname=${_pkgname}-bin
pkgver=5.11.1
pkgrel=1
pkgdesc="A Python and Command-Line Interface to Archive.org"
arch=('x86_64')
url="https://archive.org/download/ia-pex/"
license=('AGPL-3.0')
conflicts=(${pkgname})
source=("${_pkgname}-${pkgver}::https://archive.org/download/ia-pex/ia")
sha512sums=('e34ccd6744b5bc3ada163301f0bbff6f30169d54e6e307613b7a82ed20b2aaedb9d3e204e6852b48488e44777454ebc7114239a9d2d5e112a199458f734ab28d')
noextract=("${_pkgname}-${pkgver}")

package() {
	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}"/usr/bin/${_pkgname}
}
