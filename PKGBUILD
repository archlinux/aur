# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=useragent
pkgname=${_pkgname}-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Standalone tool that generates a random combination of user-agents strings."
arch=('x86_64')
url="https://github.com/DataHenHQ/useragent"
license=('Apache')
provides=(${_pkgname})
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("https://github.com/DataHenHQ/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_x86_64=('9688bad133377a651951aae7387b23d7dd5153a2dd9eddca1ad6d4e085189afa')

package() {
	cd "${srcdir}"
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
