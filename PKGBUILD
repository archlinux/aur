# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=ia
pkgname=${_pkgname}-bin
pkgver=3.6.0
pkgrel=2
pkgdesc="A Python and Command-Line Interface to Archive.org"
arch=('x86_64')
url="https://archive.org/download/ia-pex/"
license=('GPL')
provides=(${pkgname})
conflicts=(${pkgname})
source=("${_pkgname}-${pkgver}::https://archive.org/download/ia-pex/ia")
sha512sums=('fe4ddffb738c6095f70006af31d905aa63334b6908007828f55be2e0de7cf8d5ee3c6707c60f4d4ad9b955b0b74ae7cf30003f86786d5e6f71de62a72b26028c')
noextract=("${_pkgname}-${pkgver}")

package() {
	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}"/usr/bin/${_pkgname}
}
