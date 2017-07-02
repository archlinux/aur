# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-pipemenus-git
_pkgname=archlabs-pipemenus
_destname="/usr/bin/"
pkgver=2.0
pkgrel=0
pkgdesc="Pipemenu's for ARCHLabs"
arch=('any')
url="https://github.com/ARCHLabs/Archlabs-pipemenus"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
depends=()
provides=("${pkgname}")
options=(!strip !emptydirs)
source=(${_pkgname}::"git+https://github.com/ARCHLabs/${_pkgname}.git")
sha256sums=('SKIP')
package() {
	rm -f "${srcdir}/${_pkgname}/"README.md
	rm -f "${srcdir}/${_pkgname}/"git-v*
	rm -f "${srcdir}/${_pkgname}/"cleanup.sh
	mkdir -p "${pkgdir}${_destname}"
	cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}${_destname}"
}
