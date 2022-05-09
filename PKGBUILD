# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=imjtool
pkgname=${_pkgname}-bin
pkgver=1.10
pkgrel=2
pkgdesc="Rudimentary Android image and partition unpacking tool."
	arch=('x86_64')
url="http://newandroidbook.com/tools/imjtool.html"
license=('BSD')
provides=(${_pkgname})
source=(
  "${_pkgname}-${pkgver}.tgz::http://newandroidbook.com/tools/imjtool.tgz"
)
sha512sums=(
  '440c212933ebddd4c2ee3fde01fbc58636ba0001dd83e28b21fa8a81df9907230066fa02ecc3c9b19d43478380d71465f76b6c331ced18eabbd27113dabfbe83'
)

package() {
	cd "${srcdir}"
	install -Dm755 "${_pkgname}.ELF64" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
