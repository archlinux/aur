# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=ia
pkgname=${_pkgname}-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="A Python and Command-Line Interface to Archive.org"
arch=('x86_64')
url="https://archive.org/download/ia-pex/"
license=('GPL')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://archive.org/download/ia-pex/ia")
sha512sums=('5c7fae0eb33301bb6bb3531fe4b45ed34f9309269b4423e5f0596b07e761e869f49799b07544c9203200cb74643190bbfbb59d0db909a90f383eac63c32fda22')

package() {
	cd ${startdir}
	install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/${_pkgname}
}
