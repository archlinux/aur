# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=imjtool
pkgname=${_pkgname}-bin
pkgver=2.0
pkgrel=1
pkgdesc="Rudimentary Android image and partition unpacking tool."
	arch=('x86_64')
url="http://newandroidbook.com/tools/imjtool.html"
license=('BSD')
provides=(${_pkgname})
source=(
  "${_pkgname}-${pkgver}.tgz::http://newandroidbook.com/tools/imjtool.tgz"
)
sha512sums=('1e941f26f742c9ec7491f56351bb973e1fe6c70aff78ff2814e07ef8c10dae98c9acdbfc32aa89811a97cdec96b5c004cf3fb0cb98b20e66dd88f322912d9649')

package() {
	cd "${srcdir}"
	install -Dm755 "${_pkgname}.ELF64" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
