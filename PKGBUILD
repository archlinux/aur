# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-tint2-themes-git
pkgver=1.1
pkgrel=1
pkgdesc="Tint2 Themes for ARCHLabs"
arch=('any')
url="https://github.com/ARCHLabs/Archlabs-Tint2-Themes"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=('archlabs-wallpapers-git')
options=(!strip !emptydirs)
source=('git+https://github.com/ARCHLabs/Archlabs-Tint2-Themes.git')
sha256sums=('SKIP')
package() {
	mkdir -p "${pkgdir}/usr/share/tint2/"
	cp -r "${srcdir}/Archlabs-Tint2-Themes/"*.tint2rc "${pkgdir}/usr/share/tint2/"
}
