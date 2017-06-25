# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-oblogout-themes-git
_pkgname=archlabs-oblogout-themes
_destname="/usr/share/themes/"
pkgver=1.1
pkgrel=6
pkgdesc="Oblogout themes created for ARCHLabs"
arch=('any')
url="https://github.com/ARCHLabs/Archlabs-oblogout-themes"
license=('GPL3')
makedepends=('git')
depends=()
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
