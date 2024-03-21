# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=ia
pkgname=${_pkgname}-bin
pkgver=3.7.0
pkgrel=1
pkgdesc="A Python and Command-Line Interface to Archive.org"
arch=('x86_64')
url="https://archive.org/download/ia-pex/"
license=('GPL')
provides=(${pkgname})
conflicts=(${pkgname})
source=("${_pkgname}-${pkgver}::https://archive.org/download/ia-pex/ia")
sha512sums=('8130ac62810a90fe323e0f33a9f910ee7466bc3efa0984c16321228e911cfeb02e2ecea59078873542cae336ac8b566762fd7e8cffef92e22e84f429aa15c3f0')
noextract=("${_pkgname}-${pkgver}")

package() {
	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}"/usr/bin/${_pkgname}
}
