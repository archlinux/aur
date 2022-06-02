# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=imjtool
pkgname=${_pkgname}-bin
pkgver=2
pkgrel=1
pkgdesc="Rudimentary Android image and partition unpacking tool."
	arch=('x86_64')
url="http://newandroidbook.com/tools/imjtool.html"
license=('BSD')
provides=(${_pkgname})
source=(
  "${_pkgname}-${pkgver}.tgz::http://newandroidbook.com/tools/imjtool.tgz"
)
sha512sums=(
  '2ea897a3a62b424e545206738ad7b05590fdf8cbaff1b2282d687ac92119d268a0947742b09b2bd247783e706bca95fa01c162ce6582c821b4e1aa955ad427bd'
)

package() {
	cd "${srcdir}"
	install -Dm755 "${_pkgname}.ELF64" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
