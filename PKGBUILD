# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-wallpapers-4k-git
_pkgname=archlabs-wallpapers-4k
_destname="/usr/share/backgrounds/archlabs-4k/"
pkgver=1.1
pkgrel=1
pkgdesc="Wallpapers for ARCHLabs"
arch=('any')
url="https://github.com/ARCHLabs/archlabs-wallpapers-4k"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=("${pkgname}")
options=(!strip !emptydirs)
source=(${_pkgname}::"git+https://github.com/ARCHLabs/${_pkgname}.git")
sha256sums=('SKIP')
package() {
	rm -f "${srcdir}/${_pkgname}/"README.md
	rm -f "${srcdir}/${_pkgname}/"git-v*
	mkdir -p "${pkgdir}${_destname}"
	cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}${_destname}"
}
