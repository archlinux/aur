# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-pipemenus-git
_pkgname=archlabs-pipemenus
_destname="/usr/bin/"
pkgver=1.1
pkgrel=2
pkgdesc="Plank themes for ARCHLabs"
arch=('any')
url="https://github.com/ARCHLabs/Archlabs-pipemenus"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=('archlabs-pipemenus-git')
options=(!strip !emptydirs)
source=('archlabs-pipemenus::git+https://github.com/ARCHLabs/Archlabs-pipemenus.git')
sha256sums=('SKIP')
package() {
	rm -f "${srcdir}/${_pkgname}/"README.md
	rm -f "${srcdir}/${_pkgname}/"git-v*
	rm -f "${srcdir}/${_pkgname}/"cleanup.sh
	mkdir -p "${pkgdir}${_destname}"
	cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}${_destname}"
}
