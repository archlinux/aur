# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-pipemenus-git
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
	rm -f "${srcdir}/archlabs-pipemenus/"README.md
	rm -f "${srcdir}/archlabs-pipemenus/"git-v*
	rm -f "${srcdir}/archlabs-pipemenus/"cleanup.sh
	mkdir -p "${pkgdir}/usr/bin/"
	cp -r "${srcdir}/archlabs-pipemenus/"* "${pkgdir}/usr/bin/"
}
