# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=imjtool
pkgname=${_pkgname}-bin
pkgver=1.9
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
  'd4354de0f9f1c9332e179fa30ae401fce91e51c44e19a13f2798cea5215d63c6e3d8657523753583967c235ce5166ab3a3aaac8544f5789a347c094fc14ede9a'
)

package() {
	cd "${srcdir}"
	install -Dm755 "${_pkgname}.ELF64" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
