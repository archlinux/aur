# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-wallpapers
pkgver=1.1
pkgrel=12
pkgdesc="Wallpapers for ARCHLabs"
arch=('any')
url="https://github.com/ARCHLabs/Archlabs-Wallpapers"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=('archlabs-wallpapers-git')
options=(!strip !emptydirs)
source=('archlabs-wallpapers::git+https://github.com/ARCHLabs/Archlabs-Wallpapers.git')
sha256sums=('SKIP')
package() {
	rm -f "${srcdir}/archlabs-wallpapers/"README.md
	rm -f "${srcdir}/archlabs-wallpapers/"git-v*
	mkdir -p "${pkgdir}/usr/share/backgrounds/archlabs/"
	cp -r "${srcdir}/archlabs-wallpapers/"* "${pkgdir}/usr/share/backgrounds/archlabs/"
}
