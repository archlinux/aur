# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=ia
pkgname=${_pkgname}-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="A Python and Command-Line Interface to Archive.org"
arch=('x86_64')
url="https://archive.org/download/ia-pex/"
license=('GPL')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://archive.org/download/ia-pex/ia")
sha512sums=('3555104d9d2692a02ed2af5bc59b9c539defc49910ec401c298d71e84d56a761ea04468f53dd254d820d6d0d844c0512b23638837e1ca86597038b62668045f2')

package() {
	cd ${startdir}
	install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/${_pkgname}
}
