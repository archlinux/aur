# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=imjtool
pkgname=${_pkgname}-bin
pkgver=2.0b3
pkgrel=1
pkgdesc="Rudimentary Android image and partition unpacking tool."
	arch=('x86_64')
url="http://newandroidbook.com/tools/imjtool.html"
license=('BSD')
provides=(${_pkgname})
source=(
  "${_pkgname}-${pkgver}.tgz::http://newandroidbook.com/tools/imjtool.tgz"
)
sha512sums=('7fc33e90c74ec653b346baa7c73c21f944ce684505830f0b0eac617f712738e19e21c6ae82febc8e223a9b52c284778ccaf5f7767a7d1e7b81dcba6419f08a90')

package() {
	cd "${srcdir}"
	install -Dm755 "${_pkgname}.ELF64" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
