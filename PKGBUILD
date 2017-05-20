# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-plank-themes-git
pkgver=1.1
pkgrel=2
pkgdesc="Plank themes for ARCHLabs"
arch=('any')
url="https://github.com/ARCHLabs/Archlabs-Plank-Themes"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=('archlabs-plank-themes-git')
options=(!strip !emptydirs)
source=('archlabs-plank-themes::git+https://github.com/ARCHLabs/Archlabs-Plank-Themes.git')
sha256sums=('SKIP')
package() {
	mkdir -p "${pkgdir}/usr/share/plank/themes/"
	cp -r "${srcdir}/archlabs-plank-themes/themes/"* "${pkgdir}/usr/share/plank/themes/"
}
