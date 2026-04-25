# Maintainer: Mike Pento <mjpento@gmail.com>

_pkgname=PropagandaTiles
pkgname=propaganda-tiles
pkgver=1.00
pkgrel=1
pkgdesc="Collection of seamless tiled images for Linux."
arch=(any)
url="https://github.com/BenjaminHCCarr/PropagandaTiles"
options+=('!debug')
license=('GPL-1.0-or-later')
source=(git+https://github.com/BenjaminHCCarr/${_pkgname}.git)
sha256sums=('SKIP')

package() {
	cd "${_pkgname}"

	mkdir -p ${pkgdir}/usr/share/backgrounds/${_pkgname}/Goodies
	mkdir -p ${pkgdir}/usr/share/backgrounds/${_pkgname}/Images

	cp -a COPYING ${pkgdir}/usr/share/backgrounds/${_pkgname}/
	cp -a LICENSE ${pkgdir}/usr/share/backgrounds/${_pkgname}/
	cp -a README-GPL ${pkgdir}/usr/share/backgrounds/${_pkgname}/
	cp -a README-PROPAGANDA ${pkgdir}/usr/share/backgrounds/${_pkgname}/
	cp -a ./Goodies/*.JPG ${pkgdir}/usr/share/backgrounds/${_pkgname}/Goodies/
	cp -a ./Goodies/magicbg.tar.gz ${pkgdir}/usr/share/backgrounds/${_pkgname}/Goodies/
	cp -a ./Images/*.JPG ${pkgdir}/usr/share/backgrounds/${_pkgname}/Images/
}
