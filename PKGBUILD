# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=ia
pkgname=${_pkgname}-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="A Python and Command-Line Interface to Archive.org"
arch=('x86_64')
url="https://archive.org/download/ia-pex/"
license=('GPL')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://archive.org/download/ia-pex/ia")
sha512sums=('f48a925749ee84004b50f979f53d134bc015398d5a80df08258c477823b6d640d55b1f2f133afa78df192d7e295236262cfe0514278453e198ce93948f3a37cb')

package() {
	cd ${startdir}
	install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/${_pkgname}
}
