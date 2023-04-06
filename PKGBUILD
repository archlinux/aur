# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=ia
pkgname=${_pkgname}-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="A Python and Command-Line Interface to Archive.org"
arch=('x86_64')
url="https://archive.org/download/ia-pex/"
license=('GPL')
provides=(${pkgname})
conflicts=(${pkgname})
source=("${_pkgname}-${pkgver}::https://archive.org/download/ia-pex/ia")
sha512sums=('245ad73dc58e51a03001a73a5660767510f64affcf3dab92f1b77f4edac6c1adec34822e7fac1f97a93f9d8edc9eb3c115ee08ce9fc175ee49c24a2054cd5cf9')
noextract=("${_pkgname}-${pkgver}")

package() {
	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}"/usr/bin/${_pkgname}
}
