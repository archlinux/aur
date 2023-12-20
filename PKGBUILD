# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=ia
pkgname=${_pkgname}-bin
pkgver=3.6.0
pkgrel=1
pkgdesc="A Python and Command-Line Interface to Archive.org"
arch=('x86_64')
url="https://archive.org/download/ia-pex/"
license=('GPL')
provides=(${pkgname})
conflicts=(${pkgname})
source=("${_pkgname}-${pkgver}::https://archive.org/download/ia-pex/ia")
sha512sums=('d67d77c8a4d560c1fa312bda7ca54e8851032e46e43ace2269fbe1a7a530c001478e4ade233014dc86f5dfb085835ec7c92b244baa89c9554cff86f08aa4afa3')
noextract=("${_pkgname}-${pkgver}")

package() {
	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}"/usr/bin/${_pkgname}
}
