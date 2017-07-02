# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-tint2-themes-git
_pkgname=archlabs-tint2-themes
_destname="/usr/share/tint2/"
pkgver=2.0
pkgrel=0
pkgdesc="Tint2 Themes created for ArchLabs"
arch=('any')
url="https://github.com/ARCHLabs/Archlabs-Tint2-Themes"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
depends=('tint2')
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
