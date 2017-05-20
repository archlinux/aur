# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-tint2-themes-git
_pkgname=archlabs-tint2-themes
_destname="/usr/share/tint2/"
pkgver=1.1
pkgrel=6
pkgdesc="Tint2 Themes for ARCHLabs"
arch=('any')
url="https://github.com/ARCHLabs/Archlabs-Tint2-Themes"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
depends=('tint2')
provides=('archlabs-tint2-themes-git')
options=(!strip !emptydirs)
source=('git+https://github.com/ARCHLabs/Archlabs-Tint2-Themes.git')
sha256sums=('SKIP')
package() {
	mkdir -p "${pkgdir}${_destname}"
	cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}${_destname}"
}
